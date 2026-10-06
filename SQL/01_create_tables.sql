-- Pharmacy Management System
-- Oracle Database DDL

CREATE TABLE Hospital (
  Hospital_ID NUMBER PRIMARY KEY,
  Hos_Name VARCHAR2(100) NOT NULL,
  Location VARCHAR2(100),
  Phone VARCHAR2(15)
);
CREATE TABLE Doctor (
  Doc_ID NUMBER PRIMARY KEY,
  Doc_Name VARCHAR2(100) NOT NULL,
  Contact VARCHAR2(15),
  Hospital_ID NUMBER,
  CONSTRAINT fk_doctor_hospital
    FOREIGN KEY (Hospital_ID)
    REFERENCES Hospital(Hospital_ID)
);
CREATE TABLE Patient (
  Patient_ID NUMBER PRIMARY KEY,
  Patient_Name VARCHAR2(100) NOT NULL,
  Gender VARCHAR2(10),
  Phone VARCHAR2(15),
  Address VARCHAR2(200),
  Patient_Details VARCHAR2(300)
);
CREATE TABLE Pharmacy (
  Store_ID NUMBER PRIMARY KEY,
  Store_Name VARCHAR2(100) NOT NULL,
  Location VARCHAR2(100),
  PinCode VARCHAR2(10),
  Phone VARCHAR2(15),
  Hospital_ID NUMBER,
  CONSTRAINT fk_pharmacy_hospital
    FOREIGN KEY (Hospital_ID)
    REFERENCES Hospital(Hospital_ID)
);
CREATE TABLE Employee (
  Emp_ID NUMBER PRIMARY KEY,
  Emp_Name VARCHAR2(100) NOT NULL,
  Gender VARCHAR2(10),
  Phone VARCHAR2(15),
  Salary NUMBER(10,2) CHECK (Salary > 0),
  Store_ID NUMBER,
  CONSTRAINT fk_employee_store
    FOREIGN KEY (Store_ID)
    REFERENCES Pharmacy(Store_ID)
);
CREATE TABLE Medicine (
  Drug_ID NUMBER PRIMARY KEY,
  Drug_Name VARCHAR2(100) NOT NULL,
  Manufacturer VARCHAR2(100),
  Price NUMBER(10,2) CHECK (Price > 0),
  Quantity NUMBER CHECK (Quantity >= 0),
  Exp_Date DATE
);
CREATE TABLE Supplier (
  Supplier_ID NUMBER PRIMARY KEY,
  Supplier_Name VARCHAR2(100) NOT NULL,
  Phone VARCHAR2(15),
  Location VARCHAR2(100),
  Quoted_Price NUMBER(10,2)
);
CREATE TABLE Bill (
  Bill_ID NUMBER PRIMARY KEY,
  Bill_Date DATE,
  Total_Amount NUMBER(10,2),
  Payment_Mode VARCHAR2(20),
  Store_ID NUMBER,
  CONSTRAINT fk_bill_store
    FOREIGN KEY (Store_ID)
    REFERENCES Pharmacy(Store_ID)
);
CREATE TABLE Bill_Item (
  Item_ID NUMBER PRIMARY KEY,
  Bill_ID NUMBER NOT NULL,
  Drug_ID NUMBER,
  Quantity NUMBER CHECK (Quantity > 0),
  Unit_Price NUMBER(10,2),
  Discount NUMBER(5,2),
  CONSTRAINT fk_item_bill
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID),
  CONSTRAINT fk_item_drug
    FOREIGN KEY (Drug_ID) REFERENCES Medicine(Drug_ID)
);
CREATE TABLE Consults (
  Patient_ID NUMBER,
  Doc_ID NUMBER,
  CONSTRAINT pk_consults PRIMARY KEY (Patient_ID, Doc_ID),
  CONSTRAINT fk_consults_patient
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
  CONSTRAINT fk_consults_doctor
    FOREIGN KEY (Doc_ID) REFERENCES Doctor(Doc_ID)
);
CREATE TABLE Sells (
  Store_ID NUMBER,
  Drug_ID NUMBER,
  CONSTRAINT pk_sells PRIMARY KEY (Store_ID, Drug_ID),
  CONSTRAINT fk_sells_store
    FOREIGN KEY (Store_ID) REFERENCES Pharmacy(Store_ID),
  CONSTRAINT fk_sells_drug
    FOREIGN KEY (Drug_ID) REFERENCES Medicine(Drug_ID)
);
CREATE TABLE Supplies (
  Store_ID NUMBER,
  Supplier_ID NUMBER,
  CONSTRAINT pk_supplies PRIMARY KEY (Store_ID, Supplier_ID),
  CONSTRAINT fk_supplies_store
    FOREIGN KEY (Store_ID) REFERENCES Pharmacy(Store_ID),
  CONSTRAINT fk_supplies_supplier
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);
