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