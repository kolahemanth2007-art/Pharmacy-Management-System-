-- Pharmacy Management System
-- Oracle Database DML / sample data

INSERT INTO Hospital VALUES
(1,'City General Hospital','Kakinada','0884234567');
INSERT INTO Hospital VALUES
(2,'Sri Sai Hospital','Rajahmundry','0883245678');
INSERT INTO Doctor VALUES (101,'Dr. Ramesh Kumar','9876500001',1);
INSERT INTO Doctor VALUES (102,'Dr. Sunitha Rao','9876500002',1);
INSERT INTO Doctor VALUES (103,'Dr. Anil Verma','9876500003',2);
INSERT INTO Patient VALUES
(1,'A. Kiran','Male','9345600001','Kakinada','Fever and cold');
INSERT INTO Patient VALUES
(2,'S. Divya','Female','9345600002','Rajahmundry','Seasonal allergy');
INSERT INTO Pharmacy VALUES
(1,'HealthPlus Pharmacy','Kakinada','533001','9123400001',1);
INSERT INTO Pharmacy VALUES
(2,'MediCare Pharmacy','Rajahmundry','533101','9123400002',2);
INSERT INTO Employee VALUES
(1,'K. Suresh','Male','9000000001',18000,1);
INSERT INTO Employee VALUES
(2,'P. Lakshmi','Female','9000000002',22000,1);
INSERT INTO Employee VALUES
(3,'M. Ravi','Male','9000000003',20000,2);
INSERT INTO Medicine VALUES
(1,'Paracetamol 500mg','Cipla',25.00,200,DATE '2027-08-31');
INSERT INTO Medicine VALUES
(2,'Amoxicillin 250mg','Sun Pharma',85.50,120,DATE '2027-03-15');
INSERT INTO Medicine VALUES
(3,'Cetirizine 10mg','Dr. Reddys',30.00,40,DATE '2026-12-31');
INSERT INTO Medicine VALUES
(4,'Azithromycin 500mg','Cipla',120.00,60,DATE '2027-05-20');
INSERT INTO Supplier VALUES
(1,'Apex Distributors','9111100001','Vijayawada',22.50);
INSERT INTO Supplier VALUES
(2,'Global Pharma Supplies','9111100002','Hyderabad',80.00);
INSERT INTO Consults VALUES (1,101);
INSERT INTO Consults VALUES (2,102);
INSERT INTO Sells VALUES (1,1);
INSERT INTO Sells VALUES (1,2);
INSERT INTO Sells VALUES (1,3);
INSERT INTO Sells VALUES (2,1);
INSERT INTO Sells VALUES (2,4);
INSERT INTO Supplies VALUES (1,1);
INSERT INTO Supplies VALUES (1,2);
INSERT INTO Supplies VALUES (2,2);
INSERT INTO Bill VALUES
(1001,DATE '2026-09-20',135.50,'Cash',1);
INSERT INTO Bill VALUES
(1002,DATE '2026-09-21',170.00,'UPI',2);
INSERT INTO Bill_Item VALUES (1,1001,1,2,25.00,0);
INSERT INTO Bill_Item VALUES (2,1001,2,1,85.50,0);
INSERT INTO Bill_Item VALUES (3,1002,4,1,120.00,0);
INSERT INTO Bill_Item VALUES (4,1002,1,2,25.00,0);
UPDATE Medicine
SET Price = 130.00
WHERE Drug_ID = 4;
DELETE FROM Bill_Item
WHERE Item_ID = 4;
