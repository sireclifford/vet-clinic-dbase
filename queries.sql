/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name not like '%Gabumon%';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- What animals belong to Melody Pond?
SELECT * from animals WHERE owner_id = 4;
--List of all animals that are pokemon (their type is Pokemon).
SELECT * from animals WHERE species_id = 1;
--List of all owners and their animals, remember to include those that don't own any animal.
SELECT * from owners LEFT JOIN animals ON owners.id = animals.owner_id;
--How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) from species LEFT JOIN animals ON species.id = animals.species_id GROUP BY species.name;
--List all Digimon owned by Jennifer Orwell.
SELECT * from animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = 2;
--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.owner_id) from owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.owner_id) DESC LIMIT 1;

-- set species column to 'unspecified' for all animals
UPDATE animals SET species = 'unspecified';

-- rollback the changes
ROLLBACK;

BEGIN TRANSACTION;

-- set species column to 'digimon' for all animals that have 'mon' in their name
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- set species column to 'pokemon' for all animals that don't have 'mon' in their name
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';

-- commit the changes
COMMIT;

-- delete all rows in table
BEGIN;

DELETE FROM animals;

ROLLBACK;

-- UPDATE AND DELETE TRANSACTION
BEGIN
--delete all animals born after 2022-01-01
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
--Create a savepoint for the transaction
SAVEPOINT after_dof_delete;
--Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
--Rollback to the savepoint
ROLLBACK TO after_dof_delete;
--Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
--Commit transaction
COMMIT;

--How many animals are there?
SELECT COUNT(*) FROM animals;
--How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
--What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
--Who escapes the most, neutered or not neutered animals?
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
--What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-- QUERIES TO QUESTIONS REGARDING JOIN TABLES
-- last animal seen by William Tatcher
SELECT
  animals.name
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.vet_id = 1
ORDER BY
  visits.date_of_visit DESC
LIMIT
  1;

-- Number of animals seen by Stephanie Mendez
SELECT
  animals.name,
  COUNT(*)
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.vet_id = 3
GROUP BY
  animals.name;

-- list all vets and their specialties
SELECT
  vets.name,
  specialization.species_id
FROM
  vets
  LEFT JOIN specialization ON vets.id = specialization.vet_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020
SELECT
  animals.name
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.vet_id = 3
  AND visits.date_of_visit BETWEEN date '2020-04-01'
  AND date '2020-08-30';

-- Animal with the most visits to vet
SELECT
  animals.name
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
GROUP BY
  animals.name
ORDER BY
  COUNT(*) DESC
LIMIT
  1;

-- Maisy Smith's first visit
SELECT
  animals.name
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.vet_id = 2
  AND visits.date_of_visit = (
    SELECT
      MIN(date_of_visit)
    FROM
      visits
    WHERE
      visits.vet_id = 2
  );

-- Details for most recent visit: animal information, vet information, and date of visit
SELECT
  animals.name,
  visits.vet_id,
  visits.date_of_visit
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.date_of_visit = (
    SELECT
      MAX(date_of_visit)
    FROM
      visits
  );

-- Number of visits with a vet that did not specialize in a particular species
SELECT
  COUNT(visits.animal_id)
FROM
  visits
  INNER JOIN vets ON visits.vet_id = vets.id
  INNER JOIN animals ON animals.id = visits.animal_id
  INNER JOIN specialization ON specialization.species_id = vets.id
WHERE
  specialization.species_id != animals.species_id;

-- Most species visits for Maisy
SELECT
  animals.species_id,
  COUNT(*)
FROM
  animals
  INNER JOIN visits ON animals.id = visits.animal_id
WHERE
  visits.vet_id = 2
GROUP BY
  animals.species_id
ORDER BY
  COUNT(*) DESC
LIMIT
  1;

  