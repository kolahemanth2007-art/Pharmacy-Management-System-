-- Pharmacy Management System
-- Queries extracted from the project documentation.
-- Note: the documentation says 30 queries, but it contains Q1 through Q31.

Q1. Display all hospitals
SELECT * FROM Hospital;

Q2. Display all patients
SELECT * FROM Patient;

Q3. Display all doctors
SELECT * FROM Doctor;

Q4. Display all medicines
SELECT * FROM Medicine;

Q5. Medicines priced above 100
SELECT * FROM Medicine WHERE Price > 100;

Q6. Medicines sorted by price (highest first)
SELECT Drug_Name, Price FROM Medicine
ORDER BY Price DESC;

Q7. Medicines expiring before 2027
SELECT Drug_Name, Exp_Date FROM Medicine
WHERE Exp_Date < DATE '2027-01-01';

Q8. Low-stock medicines (quantity below 50)
SELECT Drug_Name, Quantity FROM Medicine
WHERE Quantity < 50;

Q9. Female patients
SELECT * FROM Patient WHERE Gender = 'Female';

Q10. Employees earning more than 20000
SELECT Emp_Name, Salary FROM Employee
WHERE Salary > 20000;

Q11. Doctors with their hospital
SELECT d.Doc_Name, h.Hos_Name
FROM Doctor d JOIN Hospital h
ON d.Hospital_ID = h.Hospital_ID;

Q12. Pharmacies with their associated hospital
SELECT p.Store_Name, h.Hos_Name
FROM Pharmacy p JOIN Hospital h
ON p.Hospital_ID = h.Hospital_ID;

Q13. Employees with their pharmacy
SELECT e.Emp_Name, p.Store_Name
FROM Employee e JOIN Pharmacy p
ON e.Store_ID = p.Store_ID;

Q14. Patients and the doctors they consult
SELECT p.Patient_Name, d.Doc_Name
FROM Consults c
JOIN Patient p ON c.Patient_ID = p.Patient_ID
JOIN Doctor d ON c.Doc_ID = d.Doc_ID;

Q15. Medicines sold by each pharmacy
SELECT p.Store_Name, m.Drug_Name
FROM Sells s
JOIN Pharmacy p ON s.Store_ID = p.Store_ID
JOIN Medicine m ON s.Drug_ID = m.Drug_ID;

Q16. Suppliers of each pharmacy
SELECT p.Store_Name, sp.Supplier_Name
FROM Supplies s
JOIN Pharmacy p ON s.Store_ID = p.Store_ID
JOIN Supplier sp ON s.Supplier_ID = sp.Supplier_ID;

Q17. Bills with pharmacy name
SELECT b.Bill_ID, b.Bill_Date, p.Store_Name
FROM Bill b JOIN Pharmacy p
ON b.Store_ID = p.Store_ID;

Q18. Bill items with medicine name
SELECT bi.Bill_ID, m.Drug_Name, bi.Quantity, bi.Unit_Price
FROM Bill_Item bi JOIN Medicine m
ON bi.Drug_ID = m.Drug_ID;

Q19. Total number of medicines
SELECT COUNT(*) AS Total_Medicines FROM Medicine;

Q20. Average medicine price
SELECT AVG(Price) AS Avg_Price FROM Medicine;

Q21. Highest and lowest medicine price
SELECT MAX(Price) AS Max_Price,
       MIN(Price) AS Min_Price
FROM Medicine;

Q22. Total sales amount
SELECT SUM(Total_Amount) AS Total_Sales FROM Bill;

Q23. Number of bills per payment mode
SELECT Payment_Mode, COUNT(*) AS Bill_Count
FROM Bill GROUP BY Payment_Mode;

Q24. Employees per pharmacy
SELECT Store_ID, COUNT(*) AS Emp_Count
FROM Employee GROUP BY Store_ID;

Q25. Hospitals having more than one doctor
SELECT Hospital_ID, COUNT(*) AS Doc_Count
FROM Doctor GROUP BY Hospital_ID
HAVING COUNT(*) > 1;

Q26. Medicines by manufacturer Cipla
SELECT Drug_Name FROM Medicine
WHERE Manufacturer = 'Cipla';

Q27. Search medicine by keyword
SELECT * FROM Medicine
WHERE UPPER(Drug_Name) LIKE '%CILLIN%';

Q28. Highest paid employee
SELECT Emp_Name, Salary FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

Q29. Medicines priced above the average price
SELECT Drug_Name, Price FROM Medicine
WHERE Price > (SELECT AVG(Price) FROM Medicine);

Q30. Total quantity sold per medicine
SELECT m.Drug_Name, SUM(bi.Quantity) AS Qty_Sold
FROM Bill_Item bi JOIN Medicine m
ON bi.Drug_ID = m.Drug_ID
GROUP BY m.Drug_Name;

Q31. Patients who have not consulted any doctor
SELECT Patient_Name FROM Patient
WHERE Patient_ID NOT IN
  (SELECT Patient_ID FROM Consults);
