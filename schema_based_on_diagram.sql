-- patients table
CREATE TABLE patients
(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE
);

-- medical histories table
CREATE TABLE medical_histories
(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
);