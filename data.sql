/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (1, 'Agumon', '2020-02-03', 0, false, 10.23);
  
    INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
  
      INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
  
  INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

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
