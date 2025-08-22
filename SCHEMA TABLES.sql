-- Create the main database (You can use 'attendance' if instructed, else 'hospital_management')
CREATE DATABASE attendance;
USE attendance;
-- Patient Table
-- Stores patient demographics. Enforces gender and unique email.
CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200)
);
-- Doctor Table
-- Stores doctor details, specialization, unique email.
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
 -- Department Table
 -- Represents units like Cardiology, Pediatrics.
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);
-- Room Table
-- Tracks individual rooms and their types
CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL UNIQUE,
    RoomType VARCHAR(30) CHECK (RoomType IN ('General', 'Private', 'ICU', 'OT'))
);
-- Admission Table
-- Links patients to rooms for a date range.
CREATE TABLE Admission (
    AdmissionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    RoomID INT NOT NULL,
    AdmissionDate DATE NOT NULL,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
-- Appointment Table
-- Captures outpatient visits with current statuses.
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    DepartmentID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(200),
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Treatment Table
-- Records all treatments—linked to patient, doctor, department, and admission.
CREATE TABLE Treatment (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    DepartmentID INT NOT NULL,
    AdmissionID INT,
    DateOfTreatment DATE NOT NULL,
    Description VARCHAR(200),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (AdmissionID) REFERENCES Admission(AdmissionID)
);
-- Prescription Table
-- Meds prescribed for a treatment.
CREATE TABLE Prescription (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentID INT NOT NULL,
    DoctorID INT NOT NULL,
    Medicine VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Bill Table
-- Links patient (and possibly admission) to a bill and tracks payment status.
CREATE TABLE Bill (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    AdmissionID INT,
    BillingDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Unpaid', 'Paid', 'Cancelled')),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (AdmissionID) REFERENCES Admission(AdmissionID)
);




