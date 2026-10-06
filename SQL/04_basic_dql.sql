-- DQL examples from the project documentation
SELECT * FROM Medicine;

SELECT Patient_ID, Patient_Name, Phone
FROM Patient
WHERE Gender = 'Female';

SELECT Drug_ID, Drug_Name, Price, Quantity
FROM Medicine
ORDER BY Drug_Name;

SELECT d.Doc_Name, h.Hos_Name
FROM Doctor d
JOIN Hospital h ON d.Hospital_ID = h.Hospital_ID;

SELECT b.Bill_ID, m.Drug_Name, bi.Quantity, bi.Unit_Price
FROM Bill b
JOIN Bill_Item bi ON b.Bill_ID = bi.Bill_ID
JOIN Medicine m ON bi.Drug_ID = m.Drug_ID;
