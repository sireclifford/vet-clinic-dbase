/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (1, 'Agumon', '2020-02-03', 0, false, 10.23);
  
    INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
  
      INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
  
  INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

 INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (
    5,
    'Charmander',
    date '2020-02-08',
    0,
    false,
    11.00
  );

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (6, 'Plantmon', date '2020-11-15', 2, true, 5.70);

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (
    7,
    'Squirtle',
    date '1993-04-02',
    3,
    false,
    12.13
  );

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (8, 'Angeomon', date '2005-06-12', 1, true, 45.00);

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (9, 'Boarmon', date '2005-06-07', 7, true, 20.40);

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (
    10,
    'Blossom',
    date '1998-10-13',
    3,
    false,
    17.00
  );

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  (11, 'Ditto', date '2022-05-14', 4, true, 22.00);


  --insert into owners table
  INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
  INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
  INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
  INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
  INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
  INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);


  --insert into species table
  INSERT INTO species (name) VALUES ('Pokemon');
  INSERT INTO species (name) VALUES ('Digimon');

  --update animals table with species_id
  UPDATE animals SET species_id = 2 WHERE name LIKE = '%mon';
  UPDATE animals SET species_id = 1 WHERE name NOT LIKE = '%mon';

-- update animals table with owner_id
  UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
  UPDATE animals SET owner_id = 2 WHERE name IN ('Pikachu', 'Gabumon');
  UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
  UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
  UPDATE animals SET owner_id = 5 WHERE name IN ('Angeomon', 'Boarmon');

-- insert data into vets
  INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
  INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
  INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
  INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

  --insert data into specializations
  INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
  INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
  INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

  --insert data into visits
  --Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (1, 1, '2020-05-24');
--Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (1, 3, '2020-07-22');
--Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (2, 4, '2021-02-02');
--Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-01-05');
--Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-03-08');
--Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-05-14');
--Devimon visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (4, 3, '2020-05-24');
--Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (5, 4, '2021-02-24');
--Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 2, '2019-12-21');
--Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 1, '2020-08-10');
--Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 2, '2021-04-07');
--Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (7, 3, '2019-09-29');
--Angemon visited Jack Harkness on Oct 3rd, 2020
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (8, 4, '2020-10-03');
--Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (8, 4, '2020-11-04');
--Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2019-01-24');
--Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2019-05-15');
--Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2020-02-27');
--Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2020-08-03');
--Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (10, 3, '2020-05-24');
--Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (10, 1, '2021-01-11');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series(‘1980-01-01’::timestamp, ‘2021-01-01’, ‘4 hours’) visit_timestamp;
-- This will add 2.500.000 owners with full_name = ‘Owner <X>’ and email = ‘owner_<X>@email.com’ (~2min approx.)
insert into owners (full_name, email) select ‘Owner ’ || generate_series(1,2500000), ‘owner_’ || generate_series(1,2500000) || ‘@mail.com’;
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2 LIMIT 200;
EXPLAIN ANALYZE SELECT * FROM owners where email = ‘owner_18327@mail.com’;
