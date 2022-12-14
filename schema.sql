/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
 	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT
  );

-- create table owners
CREATE TABLE owners (
	id SERIAL,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

-- create table species
CREATE TABLE species (
  id SERIAL,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

--modify animals table
BEGIN;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
  id SERIAL,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg FLOAT,
  species_id INT,
  owner_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY(species_id) REFERENCES species(id),
  FOREIGN KEY(owner_id) REFERENCES owners(id)
);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (1, 'Agumon', '2020-02-03', 0, false, 10.23);
  
    INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
  
      INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
  
  INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

  SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name not like '%Gabumon%';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

COMMIT;

--create table vets
CREATE TABLE vets (
  id SERIAL,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

--create table specializations
CREATE TABLE specializations (
  id SERIAL,
  vet_id INT,
  species_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY(vet_id) REFERENCES vets(id),
  FOREIGN KEY(species_id) REFERENCES species(id)
);

--create table visits
CREATE TABLE visits (
  id SERIAL,
  animal_id INT,
  vet_id INT,
  date_of_visit DATE,
  PRIMARY KEY(id),
  FOREIGN KEY(animal_id) REFERENCES animals(id),
  FOREIGN KEY(vet_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- add indexes to visits table

CREATE INDEX visits_animals ON visits(animal_id);

CREATE INDEX visits_vets ON visits(vet_id);

CREATE INDEX visits_date_of_visit ON visits(date_of_visit);

CREATE INDEX visits_id ON visits(id);

CREATE INDEX owners_email ON owners(email);