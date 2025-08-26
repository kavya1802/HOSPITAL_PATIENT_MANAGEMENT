-- Patient
INSERT INTO Patient (Name, DOB, Gender, Phone, Email, Address) VALUES
('Amit Sharma', '1990-04-15', 'M', '9876543210', 'amit.sharma@gmail.com', '12 Green Park, Delhi'),
('Priya Verma', '1985-12-03', 'F', '9090876541', 'priya.verma@gmail.com', '22 Lake View, Mumbai'),
('Ravi Singh', '1978-08-22', 'M', '9011234500', 'ravi.singh@gmail.com', '33 River Road, Lucknow'),
('Nisha Patel', '1995-11-11', 'F', '8800112233', 'nisha.patel@gmail.com', '44 Sunrise, Hyderabad'),
('Arun Gupta', '2002-01-19', 'M', '9678901234', 'arun.gupta@gmail.com', '55 Valley St, Pune'),
('Meena Kaur', '1969-09-30', 'F', '9834567890', 'meena.kaur@gmail.com', '66 Colaba, Mumbai'),
('Sunil Reddy', '1982-07-07', 'M', '9123456789', 'sunil.reddy@gmail.com', '77 Charminar, Hyderabad'),
('Anjali Nair', '1991-06-24', 'F', '9812345678', 'anjali.nair@gmail.com', '88 MG Road, Bengaluru'),
('Mohit Desai', '2000-05-02', 'M', '9871234565', 'mohit.desai@gmail.com', '99 Beach Road, Chennai'),
('Sneha Joshi', '1988-10-14', 'F', '9898989898', 'sneha.joshi@gmail.com', '101 Airport Rd, Indore');

-- Doctor
INSERT INTO Doctor (Name, Specialization, Email, Phone) VALUES
('Dr. Suresh Kumar', 'Cardiology', 'suresh.kumar@hospital.com', '9990000001'),
('Dr. Anita Shah', 'Dermatology', 'anita.shah@hospital.com', '9990000002'),
('Dr. Rajiv Menon', 'Orthopedics', 'rajiv.menon@hospital.com', '9990000003'),
('Dr. Kavita Agarwal', 'Pediatrics', 'kavita.agarwal@hospital.com', '9990000004'),
('Dr. Om Prakash', 'Neurology', 'om.prakash@hospital.com', '9990000005'),
('Dr. Shalini Gupta', 'Gynecology', 'shalini.gupta@hospital.com', '9990000006'),
('Dr. Rohan Mehta', 'ENT', 'rohan.mehta@hospital.com', '9990000007'),
('Dr. Feroz Ali', 'General Medicine', 'feroz.ali@hospital.com', '9990000008'),
('Dr. Lata Iyer', 'Psychiatry', 'lata.iyer@hospital.com', '9990000009'),
('Dr. Manish Sharma', 'Urology', 'manish.sharma@hospital.com', '9990000010');

-- Department
INSERT INTO Department (Name) VALUES
('Cardiology'),
('Dermatology'),
('Orthopedics'),
('Pediatrics'),
('Neurology'),
('Gynecology'),
('ENT'),
('General Medicine'),
('Psychiatry'),
('Urology');

-- Room
INSERT INTO Room (RoomNumber, RoomType) VALUES
('101A', 'General'),
('102A', 'Private'),
('103B', 'General'),
('104C', 'ICU'),
('105A', 'OT'),
('201A', 'Private'),
('202B', 'General'),
('203C', 'Private'),
('301A', 'ICU'),
('302B', 'General');

-- Admission
INSERT INTO Admission (PatientID, RoomID, AdmissionDate, DischargeDate) VALUES
(1, 1, '2025-08-01', '2025-08-08'),
(2, 2, '2025-08-03', NULL),
(3, 3, '2025-07-29', '2025-08-05'),
(4, 4, '2025-08-07', NULL),
(5, 5, '2025-08-02', '2025-08-06'),
(6, 6, '2025-07-30', NULL),
(7, 7, '2025-08-01', '2025-08-09'),
(8, 8, '2025-08-04', NULL),
(9, 9, '2025-08-06', NULL),
(10, 10, '2025-08-05', '2025-08-10');

-- Appointment
INSERT INTO Appointment (PatientID, DoctorID, DepartmentID, AppointmentDate, Reason, Status) VALUES
(1, 1, 1, '2025-08-10 10:00:00', 'Routine Check', 'Scheduled'),
(2, 2, 2, '2025-08-10 11:00:00', 'Skin Allergy', 'Scheduled'),
(3, 3, 3, '2025-08-11 09:30:00', 'Knee Pain', 'Completed'),
(4, 4, 4, '2025-08-11 15:00:00', 'Child Vaccination', 'Completed'),
(5, 5, 5, '2025-08-12 14:00:00', 'Headache', 'Cancelled'),
(6, 6, 6, '2025-08-12 12:00:00', 'Routine Check', 'Scheduled'),
(7, 7, 7, '2025-08-13 11:30:00', 'Ear Pain', 'Scheduled'),
(8, 8, 8, '2025-08-13 16:00:00', 'Fever', 'Completed'),
(9, 9, 9, '2025-08-14 13:30:00', 'Sleep Issues', 'Scheduled'),
(10, 10, 10, '2025-08-15 09:00:00', 'Kidney Check', 'Scheduled');

-- Treatment
INSERT INTO Treatment (PatientID, DoctorID, DepartmentID, AdmissionID, DateOfTreatment, Description) VALUES
(1, 1, 1, 1, '2025-08-02', 'Cardiac evaluation'),
(2, 2, 2, 2, '2025-08-04', 'Skin patch test'),
(3, 3, 3, 3, '2025-07-30', 'Knee MRI'),
(4, 4, 4, 4, '2025-08-08', 'Vaccination'),
(5, 5, 5, 5, '2025-08-03', 'Neuro consultation'),
(6, 6, 6, 6, '2025-07-31', 'Gynecology scan'),
(7, 7, 7, 7, '2025-08-02', 'ENT endoscopy'),
(8, 8, 8, 8, '2025-08-05', 'General health screening'),
(9, 9, 9, 9, '2025-08-07', 'Psychiatric evaluation'),
(10, 10, 10, 10, '2025-08-06', 'Kidney function test');

-- Prescription
INSERT INTO Prescription (TreatmentID, DoctorID, Medicine, Dosage, StartDate, EndDate) VALUES
(1, 1, 'Atenolol', '50mg', '2025-08-02', '2025-08-08'),
(2, 2, 'Cetirizine', '10mg', '2025-08-04', '2025-08-06'),
(3, 3, 'Ibuprofen', '400mg', '2025-07-30', '2025-08-05'),
(4, 4, 'Paracetamol', '500mg', '2025-08-08', '2025-08-12'),
(5, 5, 'Sumatriptan', '50mg', '2025-08-03', '2025-08-13'),
(6, 6, 'Iron Supplement', '200mg', '2025-07-31', '2025-08-07'),
(7, 7, 'Antibiotic Drops', '2 drops', '2025-08-02', '2025-08-08'),
(8, 8, 'Multivitamin', '1 tab', '2025-08-05', '2025-08-15'),
(9, 9, 'Melatonin', '5mg', '2025-08-07', '2025-08-12'),
(10, 10, 'Furosemide', '40mg', '2025-08-06', '2025-08-09');

-- Bill
INSERT INTO Bill (PatientID, AdmissionID, BillingDate, Amount, Status) VALUES
(1, 1, '2025-08-08', 8000.00, 'Paid'),
(2, 2, '2025-08-10', 9000.00, 'Unpaid'),
(3, 3, '2025-08-05', 7500.00, 'Paid'),
(4, 4, '2025-08-09', 15000.00, 'Unpaid'),
(5, 5, '2025-08-06', 8500.00, 'Paid'),
(6, 6, '2025-08-01', 7000.00, 'Paid'),
(7, 7, '2025-08-09', 12000.00, 'Unpaid'),
(8, 8, '2025-08-11', 11000.00, 'Paid'),
(9, 9, '2025-08-13', 14500.00, 'Unpaid'),
(10, 10, '2025-08-10', 9000.00, 'Paid');
