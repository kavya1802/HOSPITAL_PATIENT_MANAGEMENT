# HOSPITAL_PATIENT_MANAGEMENT
# Hospital Patient Management System

**Course:**  Managing and Querying Database  
**Project:** Hospital Patient Management System  
**Author:** KAVYA M THAKKER 
**Date:** 22 August 2025

---

## Overview

This project implements a robust relational database solution designed to manage core operations within a hospital environment. The database captures information about patients, doctors, appointments, admissions, treatments, prescriptions, bills, and departments. Built using optimized SQL, it demonstrates schema design best practices, query optimization, automation features, and security aspects, aligned with real-world healthcare data requirements.

---

## Features

- **Patient & Doctor Management:** Comprehensive profiles with constraints and relationships for integrity.
- **Appointment Scheduling:** Track, query, and update patient appointments with doctors and departments.
- **Admissions & Room Tracking:** Record patient admissions, room allocations, and discharge details.
- **Treatments & Prescriptions:** Register treatments, medicines prescribed, and doctor/department associations.
- **Billing:** Flexible billing structure linking patients and admissions with full status tracking.
- **Security & Automation:** Uses constraints, foreign keys, and is ready for triggers/stored procedures.
- **Normalized Schema:** Efficient, redundancy-free design with enforced data integrity.

---

## Database Schema

- **Patient** (`PatientID`, Name, DOB, Gender, Phone, Email, Address)
- **Doctor** (`DoctorID`, Name, Specialization, Email, Phone)
- **Department** (`DepartmentID`, Name)
- **Room** (`RoomID`, RoomNumber, RoomType)
- **Admission** (`AdmissionID`, PatientID, RoomID, AdmissionDate, DischargeDate)
- **Appointment** (`AppointmentID`, PatientID, DoctorID, DepartmentID, AppointmentDate, Reason, Status)
- **Treatment** (`TreatmentID`, PatientID, DoctorID, DepartmentID, AdmissionID, DateOfTreatment, Description)
- **Prescription** (`PrescriptionID`, TreatmentID, DoctorID, Medicine, Dosage, StartDate, EndDate)
- **Bill** (`BillID`, PatientID, AdmissionID, BillingDate, Amount, Status)

> **Full table definitions and schema** can be found in [`schema.sql`](schema.sql).

---



