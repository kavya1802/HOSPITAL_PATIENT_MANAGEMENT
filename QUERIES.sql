-- 1.1 List all patient names and their phone numbers
SELECT Name, Phone FROM Patient;

-- 1.2 List all doctors with their specializations
SELECT Name, Specialization FROM Doctor;

-- 1.3 List all departments
SELECT * FROM Department;

-- 1.4 List all rooms that are currently ICU type
SELECT RoomNumber FROM Room WHERE RoomType = 'ICU';

-- 1.5 List all appointments with status 'Scheduled'
SELECT * FROM Appointment WHERE Status = 'Scheduled';

-- 2.1 List all appointments with patient and doctor names
SELECT a.AppointmentID, p.Name AS Patient, d.Name AS Doctor, a.AppointmentDate
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;

-- 2.2 Show each patient's admission room and room type
SELECT pa.Name AS Patient, r.RoomNumber, r.RoomType
FROM Admission ad
JOIN Patient pa ON ad.PatientID = pa.PatientID
JOIN Room r ON ad.RoomID = r.RoomID;

-- 2.3 List all treatments, patient names, and doctor names
SELECT t.TreatmentID, p.Name AS Patient, d.Name AS Doctor, t.Description
FROM Treatment t
JOIN Patient p ON t.PatientID = p.PatientID
JOIN Doctor d ON t.DoctorID = d.DoctorID;

-- 2.4 List all prescriptions for each patient's latest treatment
SELECT pr.PrescriptionID, pa.Name, pr.Medicine, pr.Dosage
FROM Prescription pr
JOIN Treatment t ON pr.TreatmentID = t.TreatmentID
JOIN Patient pa ON t.PatientID = pa.PatientID
ORDER BY pr.StartDate DESC;


-- 3.1 Count of patients per department via doctor
SELECT d.DepartmentID, dep.Name AS Department, COUNT(DISTINCT a.PatientID) AS Patient_Count
FROM Admission a
JOIN Room r ON a.RoomID = r.RoomID
JOIN Department dep ON dep.DepartmentID = r.RoomID
JOIN Doctor d ON d.DoctorID = dep.DepartmentID
GROUP BY dep.Name, d.DepartmentID;

-- 3.2 Total billed amount per patient
SELECT pa.Name, SUM(b.Amount) AS Total_Bills
FROM Bill b
JOIN Patient pa ON b.PatientID = pa.PatientID
GROUP BY pa.Name;

-- 3.3 Total number of ongoing admissions (not yet discharged)
SELECT COUNT(*) AS Ongoing_Admissions
FROM Admission
WHERE DischargeDate IS NULL;

-- 3.4 Top 3 doctors with most appointments
SELECT d.Name, COUNT(*) AS Appointment_Count
FROM Appointment a
JOIN Doctor d ON a.DoctorID = d.DoctorID
GROUP BY d.Name
ORDER BY Appointment_Count DESC
LIMIT 3;


-- 4.1 List patients who have NOT received any prescription
SELECT Name FROM Patient
WHERE PatientID NOT IN (
  SELECT DISTINCT t.PatientID
  FROM Treatment t
  JOIN Prescription p ON t.TreatmentID = p.TreatmentID
);

-- 4.2 Find doctors who have performed more than 1 treatment
SELECT DoctorID, Name FROM Doctor
WHERE DoctorID IN (
  SELECT DoctorID FROM Treatment
  GROUP BY DoctorID
  HAVING COUNT(*) > 1
);

-- 4.3 Show patient with the highest bill
SELECT Name
FROM Patient
WHERE PatientID = (
  SELECT PatientID FROM Bill
  ORDER BY Amount DESC
  LIMIT 1
);


-- 5.1 Update contact number for a patient
UPDATE Patient SET Phone = '9000000000' WHERE PatientID = 1;

-- 5.2 Delete canceled appointments
DELETE FROM Appointment WHERE Status = 'Cancelled';

-- 5.3 Increase bill amount by 5% for unpaid bills
UPDATE Bill SET Amount = Amount * 1.05 WHERE Status = 'Unpaid';

-- 5.4 Discharge a patient (add discharge date)
UPDATE Admission SET DischargeDate = CURDATE() WHERE AdmissionID = 2;


-- 6.1 Trigger: Automatically set status to 'Completed' when discharge date is updated
DELIMITER //
CREATE TRIGGER Admission_Discharge_Complete
AFTER UPDATE ON Admission
FOR EACH ROW
BEGIN
  IF NEW.DischargeDate IS NOT NULL THEN
    UPDATE Appointment SET Status = 'Completed'
    WHERE PatientID = NEW.PatientID AND Status = 'Scheduled';
  END IF;
END //
DELIMITER ;

-- 6.2 Procedure: Quick admit new patient (demo)
DELIMITER //
CREATE PROCEDURE AdmitPatient(
  IN p_PatientID INT,
  IN p_RoomID INT,
  IN p_AdmissionDate DATE
)
BEGIN
  INSERT INTO Admission (PatientID, RoomID, AdmissionDate)
  VALUES (p_PatientID, p_RoomID, p_AdmissionDate);
END //
DELIMITER ;


-- 7.1 Insert JSON data for advanced patient notes
ALTER TABLE Patient ADD COLUMN ExtraNotes JSON;

UPDATE Patient
SET ExtraNotes = JSON_OBJECT('allergies', 'penicillin', 'family_history', 'hypertension')
WHERE PatientID = 1;

-- 7.2 Query: Get all allergy notes in JSON format
SELECT Name, ExtraNotes->>'$.allergies' AS Allergy
FROM Patient
WHERE ExtraNotes IS NOT NULL;
