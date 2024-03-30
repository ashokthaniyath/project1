create database project;
use project ;
-- 1. CustomerDetails
CREATE TABLE CustomerDetails (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15),
    DateOfBirth DATE,
    CarModel VARCHAR(255)
);

-- 2. CarModelDetails
CREATE TABLE CarModelDetails (
    ModelID INT PRIMARY KEY,
    ModelName VARCHAR(255),
    BodyStyle VARCHAR(50),
    EngineType VARCHAR(50),
    Horsepower INT,
    CompanyID INT,
    FOREIGN KEY (CompanyID) REFERENCES CompanyDetails(CompanyID) ON DELETE CASCADE
);

-- 3. CompanyDetails
CREATE TABLE CompanyDetails (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    HeadquartersLocation VARCHAR(255),
    Website VARCHAR(255),
    YearFounded INT,
    CompanyRevenue DECIMAL(15, 2)
);

-- 4. VehicleDetails
CREATE TABLE VehicleDetails (
    VIN VARCHAR(17) PRIMARY KEY,
    ModelID INT,
    PurchaseDate DATE,
    WarrantyExpiryDate DATE,
    InsuranceDetails TEXT,
    Mileage INT,
    FOREIGN KEY (ModelID) REFERENCES CarModelDetails(ModelID) ON DELETE CASCADE
);

-- 5. VehicleInventoryDetails
CREATE TABLE VehicleInventoryDetails (
    VIN VARCHAR(17),
    DealerID INT,
    Color VARCHAR(50),
    MadeDate DATE,
    SupplyDate DATE,
    InLocation VARCHAR(255),
    PRIMARY KEY (VIN, DealerID),
    FOREIGN KEY (VIN) REFERENCES VehicleDetails(VIN) ON DELETE CASCADE,
    FOREIGN KEY (DealerID) REFERENCES DealerDetails(DealerID) ON DELETE CASCADE
);

-- 6. SalesDetails
CREATE TABLE SalesDetails (
    SaleID INT PRIMARY KEY,
    VIN VARCHAR(17),
    CustomerID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (VIN) REFERENCES VehicleDetails(VIN) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID) ON DELETE CASCADE
);

-- 7. DealerDetails
CREATE TABLE DealerDetails (
    DealerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Location VARCHAR(255),
    PhoneNumber VARCHAR(15),
    BrandID INT,
    OwnerName VARCHAR(255),
    FOREIGN KEY (BrandID) REFERENCES BrandDetails(BrandID) ON DELETE CASCADE
);

-- 8. BrandDetails
CREATE TABLE BrandDetails (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(255),
    CountryOfOrigin VARCHAR(100),
    BrandAmbassador VARCHAR(255),
    AnnualSales DECIMAL(15, 2),
    MarketShare DECIMAL(5, 2)
);

-- 9. InventoryDetails
CREATE TABLE InventoryDetails (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(255),
    Description TEXT,
    Supplier VARCHAR(255),
    CostPrice DECIMAL(10, 2),
    StockQuantity INT
);

-- 10. VehiclePartDetails
CREATE TABLE VehiclePartDetails (
    VIN VARCHAR(17),
    PartID INT,
    Quantity INT,
    InstalledDate DATE,
    WarrantyPeriod INT,
    MaintenanceSchedule TEXT,
    PRIMARY KEY (VIN, PartID),
    FOREIGN KEY (VIN) REFERENCES VehicleDetails(VIN) ON DELETE CASCADE,
    FOREIGN KEY (PartID) REFERENCES InventoryDetails(PartID) ON DELETE CASCADE
);

-- 11. SupplierDetails
CREATE TABLE SupplierDetails (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    ContactName VARCHAR(255),
    ContactEmail VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Address TEXT
);

-- 12. EmployeeDetails
CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    JobTitle VARCHAR(100),
    HireDate DATE,
    Department VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- 13. TestDriveDetails
CREATE TABLE TestDriveDetails (
    TestDriveID INT PRIMARY KEY,
    CustomerID INT,
    VIN VARCHAR(17),
    Date DATE,
    SalespersonID INT,
    Feedback TEXT,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (VIN) REFERENCES VehicleDetails(VIN) ON DELETE CASCADE,
    FOREIGN KEY (SalespersonID) REFERENCES EmployeeDetails(EmployeeID) ON DELETE CASCADE
);


-- 1. CustomerDetails
INSERT INTO CustomerDetails (CustomerID, Name, Email, PhoneNumber, DateOfBirth, CarModel)
VALUES
(1, 'John Doe', 'johndoe@email.com', '123-456-7890', '1990-01-01', 'Sedan'),
(2, 'Jane Smith', 'janesmith@email.com', '987-654-3210', '1992-05-15', 'SUV'),
(3, 'Alice Johnson', 'alice@email.com', '111-222-3333', '1985-07-20', 'Hatchback'),
(4, 'Bob Williams', 'bob@email.com', '444-555-6666', '1988-03-10', 'Coupe'),
(5, 'Charlie Brown', 'charlie@email.com', '777-888-9999', '1995-11-25', 'Sedan'),
(6, 'David Davis', 'david@email.com', '666-555-4444', '1980-09-30', 'SUV'),
(7, 'Eva Green', 'eva@email.com', '222-333-4444', '1993-12-15', 'Hatchback');

-- 2. CarModelDetails
INSERT INTO CarModelDetails (ModelID, ModelName, BodyStyle, EngineType, Horsepower, CompanyID)
VALUES
(1, 'Model S', 'Sedan', 'Electric', 500, 1),
(2, 'Model X', 'SUV', 'Electric', 450, 1),
(3, 'Model 3', 'Hatchback', 'Electric', 350, 1),
(4, 'Model Y', 'SUV', 'Electric', 450, 1),
(5, 'Civic', 'Sedan', 'Gasoline', 180, 2),
(6, 'CR-V', 'SUV', 'Gasoline', 190, 2),
(7, 'Accord', 'Coupe', 'Gasoline', 200, 2);

-- 3. CompanyDetails
INSERT INTO CompanyDetails (CompanyID, CompanyName, HeadquartersLocation, Website, YearFounded, CompanyRevenue)
VALUES
(1, 'Tesla', 'Palo Alto, CA', 'https://www.tesla.com', 2003, 40000000000),
(2, 'Honda', 'Tokyo, Japan', 'https://www.honda.com', 1946, 10000000000),
(3, 'Toyota', 'Toyota City, Japan', 'https://www.toyota.com', 1937, 20000000000),
(4, 'Ford', 'Dearborn, MI', 'https://www.ford.com', 1903, 30000000000),
(5, 'Chevrolet', 'Detroit, MI', 'https://www.chevrolet.com', 1911, 25000000000),
(6, 'BMW', 'Munich, Germany', 'https://www.bmw.com', 1916, 35000000000),
(7, 'Mercedes-Benz', 'Stuttgart, Germany', 'https://www.mercedes-benz.com', 1926, 30000000000);

-- 4. VehicleDetails
INSERT INTO VehicleDetails (VIN, ModelID, PurchaseDate, WarrantyExpiryDate, InsuranceDetails, Mileage)
VALUES
('VIN12345678901234', 1, '2023-01-15', '2026-01-15', 'Full Coverage', 5000),
('VIN23456789012345', 2, '2022-05-20', '2025-05-20', 'Liability Only', 6000),
('VIN34567890123456', 3, '2023-03-10', '2026-03-10', 'Full Coverage', 4000),
('VIN45678901234567', 4, '2022-07-05', '2025-07-05', 'Liability Only', 5500),
('VIN56789012345678', 5, '2021-11-30', '2024-11-30', 'Full Coverage', 7000),
('VIN67890123456789', 6, '2020-09-25', '2023-09-25', 'Liability Only', 8000),
('VIN78901234567890', 7, '2022-04-15', '2025-04-15', 'Full Coverage', 6500);

-- 5. VehicleInventoryDetails
INSERT INTO VehicleInventoryDetails (VIN, DealerID, Color, MadeDate, SupplyDate, InLocation)
VALUES
('VIN12345678901234', 1, 'Red', '2023-01-10', '2023-01-12', 'Warehouse A'),
('VIN23456789012345', 2, 'Blue', '2022-05-15', '2022-05-18', 'Warehouse B'),
('VIN34567890123456', 3, 'White', '2023-03-05', '2023-03-08', 'Warehouse C'),
('VIN45678901234567', 4, 'Black', '2022-07-01', '2022-07-03', 'Warehouse D'),
('VIN56789012345678', 5, 'Silver', '2021-11-25', '2021-11-28', 'Warehouse E'),
('VIN67890123456789', 6, 'Gray', '2020-09-20', '2020-09-23', 'Warehouse F'),
('VIN78901234567890', 7, 'Green', '2022-04-10', '2022-04-13', 'Warehouse G');

-- 6. SalesDetails
INSERT INTO SalesDetails (SaleID, VIN, CustomerID, SaleDate, SalePrice, PaymentMethod)
VALUES
(1, 'VIN12345678901234', 1, '2023-01-20', 60000.00, 'Credit Card'),
(2, 'VIN23456789012345', 2, '2022-05-25', 70000.00, 'Bank Transfer'),
(3, 'VIN34567890123456', 3, '2023-03-15', 55000.00, 'Cash'),
(4, 'VIN45678901234567', 4, '2022-07-10', 65000.00, 'Credit Card'),
(5, 'VIN56789012345678', 5, '2021-12-05', 75000.00, 'Bank Transfer'),
(6, 'VIN67890123456789', 6, '2020-10-01', 50000.00, 'Cash'),
(7, 'VIN78901234567890', 7, '2022-04-20', 68000.00, 'Credit Card');

-- 7. DealerDetails
INSERT INTO DealerDetails (DealerID, Name, Location, PhoneNumber, BrandID, OwnerName)
VALUES
(1, 'Tesla Palo Alto', 'Palo Alto, CA', '123-456-7890', 1, 'Elon Musk'),
(2, 'Honda Tokyo', 'Tokyo, Japan', '987-654-3210', 2, 'Takahiro Hachigo'),
(3, 'Toyota Toyota City', 'Toyota City, Japan', '111-222-3333', 3, 'Akio Toyoda'),
(4, 'Ford Dearborn', 'Dearborn, MI', '444-555-6666', 4, 'Jim Farley'),
(5, 'Chevrolet Detroit', 'Detroit, MI', '777-888-9999', 5, 'Mary Barra'),
(6, 'BMW Munich', 'Munich, Germany', '666-555-4444', 6, 'Oliver Zipse'),
(7, 'Mercedes-Benz Stuttgart', 'Stuttgart, Germany', '222-333-4444', 7, 'Ola Källenius');

-- 8. BrandDetails
INSERT INTO BrandDetails (BrandID, BrandName, CountryOfOrigin, BrandAmbassador, AnnualSales, MarketShare)
VALUES
(1, 'Tesla', 'USA', 'Elon Musk', 100000, 25.0),
(2, 'Honda', 'Japan', 'Takahiro Hachigo', 2000000, 15.0),
(3, 'Toyota', 'Japan', 'Akio Toyoda', 3000000, 20.0),
(4, 'Ford', 'USA', 'Jim Farley', 1500000, 10.0),
(5, 'Chevrolet', 'USA', 'Mary Barra', 1200000, 10.0),
(6, 'BMW', 'Germany', 'Oliver Zipse', 800000, 7.0),
(7, 'Mercedes-Benz', 'Germany', 'Ola Källenius', 1000000, 13.0);

-- 9. InventoryDetails
INSERT INTO InventoryDetails (PartID, PartName, Description, Supplier, CostPrice, StockQuantity)
VALUES
(1, 'Tire', 'All-weather tire', 'Supplier A', 100.00, 200),
(2, 'Brake Pad', 'High-performance brake pad', 'Supplier B', 50.00, 300),
(3, 'Battery', 'Electric vehicle battery', 'Supplier C', 2000.00, 100),
(4, 'Oil Filter', 'Premium oil filter', 'Supplier D', 20.00, 400),
(5, 'Headlight', 'LED headlight', 'Supplier E', 150.00, 250),
(6, 'Windshield Wiper', 'Rain-sensing wiper', 'Supplier F', 30.00, 350),
(7, 'Radiator', 'High-efficiency radiator', 'Supplier G', 300.00, 150);

-- 10. VehiclePartDetails
INSERT INTO VehiclePartDetails (VIN, PartID, Quantity, InstalledDate, WarrantyPeriod, MaintenanceSchedule)
VALUES
('VIN12345678901234', 1, 4, '2023-01-18', 5, 'Every 6 months'),
('VIN23456789012345', 2, 2, '2022-05-22', 4, 'Every 4 months'),
('VIN34567890123456', 3, 1, '2023-03-12', 6, 'Every 7 months'),
('VIN45678901234567', 4, 3, '2022-07-07', 5, 'Every 5 months'),
('VIN56789012345678', 5, 2, '2021-11-28', 4, 'Every 4 months'),
('VIN67890123456789', 6, 1, '2020-09-28', 6, 'Every 8 months'),
('VIN78901234567890', 7, 2, '2022-04-17', 5, 'Every 6 months');

-- 11. SupplierDetails
INSERT INTO SupplierDetails (SupplierID, CompanyName, ContactName, ContactEmail, PhoneNumber, Address)
VALUES
(1, 'Supplier A Co.', 'John Doe', 'john.doe@supplierA.com', '123-456-7890', '123 Supplier St, City A'),
(2, 'Supplier B Co.', 'Jane Smith', 'jane.smith@supplierB.com', '987-654-3210', '456 Supplier St, City B'),
(3, 'Supplier C Co.', 'Alice Johnson', 'alice.johnson@supplierC.com', '111-222-3333', '789 Supplier St, City C'),
(4, 'Supplier D Co.', 'Bob Williams', 'bob.williams@supplierD.com', '444-555-6666', '012 Supplier St, City D'),
(5, 'Supplier E Co.', 'Charlie Brown', 'charlie.brown@supplierE.com', '777-888-9999', '345 Supplier St, City E'),
(6, 'Supplier F Co.', 'David Davis', 'david.davis@supplierF.com', '666-555-4444', '678 Supplier St, City F'),
(7, 'Supplier G Co.', 'Eva Green', 'eva.green@supplierG.com', '222-333-4444', '901 Supplier St, City G');

-- 12. EmployeeDetails
INSERT INTO EmployeeDetails (EmployeeID, Name, JobTitle, HireDate, Department, Salary)
VALUES
(1, 'John Doe', 'Sales Manager', '2015-01-10', 'Sales', 80000.00),
(2, 'Jane Smith', 'Mechanic', '2017-03-15', 'Service', 50000.00),
(3, 'Alice Johnson', 'Finance Manager', '2018-05-20', 'Finance', 85000.00),
(4, 'Bob Williams', 'HR Manager', '2016-04-10', 'Human Resources', 75000.00),
(5, 'Charlie Brown', 'Marketing Manager', '2019-02-28', 'Marketing', 82000.00),
(6, 'David Davis', 'Service Advisor', '2020-06-10', 'Service', 55000.00),
(7, 'Eva Green', 'Parts Manager', '2017-08-15', 'Parts', 60000.00);

-- 13. TestDriveDetails
INSERT INTO TestDriveDetails (TestDriveID, CustomerID, VIN, Date, SalespersonID, Feedback)
VALUES
(1, 1, 'VIN12345678901234', '2023-01-22', 1, 'Excellent driving experience'),
(2, 2, 'VIN23456789012345', '2022-05-28', 2, 'Smooth ride but expensive'),
(3, 3, 'VIN34567890123456', '2023-03-18', 3, 'Great handling and features'),
(4, 4, 'VIN45678901234567', '2022-07-12', 4, 'Good performance but noisy'),
(5, 5, 'VIN56789012345678', '2021-12-08', 5, 'Comfortable seats and good mileage'),
(6, 6, 'VIN67890123456789', '2020-10-03', 6, 'Powerful engine but lacks features'),
(7, 7, 'VIN78901234567890', '2022-04-22', 7, 'Decent car for the price');


-- 1. CustomerDetails
SELECT * FROM CustomerDetails;

-- 2. CarModelDetails
SELECT * FROM CarModelDetails;

-- 3. CompanyDetails
SELECT * FROM CompanyDetails;

-- 4. VehicleDetails
SELECT * FROM VehicleDetails;

-- 5. VehicleInventoryDetails
SELECT * FROM VehicleInventoryDetails;

-- 6. SalesDetails
SELECT * FROM SalesDetails;

-- 7. DealerDetails
SELECT * FROM DealerDetails;

-- 8. BrandDetails
SELECT * FROM BrandDetails;

-- 9. InventoryDetails
SELECT * FROM InventoryDetails;

-- 10. VehiclePartDetails
SELECT * FROM VehiclePartDetails;

-- 11. SupplierDetails
SELECT * FROM SupplierDetails;

-- 12. EmployeeDetails
SELECT * FROM EmployeeDetails;

-- 13. TestDriveDetails
SELECT * FROM TestDriveDetails;



-- 10 Question
-- 1st (Retrieve the total sales amount from the SalesDetails table.

SELECT SUM(SalePrice) AS TotalSalesAmount FROM SalesDetails;

-- 2nd (Calculate the average mileage of all vehicles in the VehicleDetails table.
SELECT AVG(Mileage) AS AverageMileage FROM VehicleDetails;

-- 3rd (SELECT MAX(WarrantyPeriod) AS MaxWarrantyPeriod FROM VehiclePartDetails;

SELECT MAX(WarrantyPeriod) AS MaxWarrantyPeriod FROM VehiclePartDetails;

-- 4th (Count the number of dealers associated with each brand in the DealerDetails table.
SELECT BrandName, COUNT(DealerID) AS NumberOfDealers
FROM BrandDetails
JOIN DealerDetails ON BrandDetails.BrandID = DealerDetails.BrandID
GROUP BY BrandName;

-- 5th (Calculate the total cost of all parts in the inventory from the InventoryDetails table.
SELECT SUM(CostPrice * StockQuantity) AS TotalInventoryCost FROM InventoryDetails;

-- 6th (Retrieve the names of customers along with the car models they own.
SELECT c.Name AS CustomerName, cmd.ModelName AS CarModel
FROM CustomerDetails c
JOIN VehicleDetails vd ON c.CarModel = vd.VIN
JOIN CarModelDetails cmd ON vd.ModelID = cmd.ModelID;

-- 7th (List the sales made by each dealer from the SalesDetails table.

SELECT dd.Name AS DealerName, COUNT(sd.SaleID) AS NumberOfSales
FROM DealerDetails dd
LEFT JOIN VehicleInventoryDetails vid ON dd.DealerID = vid.DealerID
LEFT JOIN SalesDetails sd ON vid.VIN = sd.VIN
GROUP BY dd.Name;

-- 8th (Find the customers who have not made any purchases.
SELECT Name
FROM CustomerDetails
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM SalesDetails);


-- 9th (Identify the car model with the highest sale price.v

SELECT ModelName
FROM CarModelDetails
WHERE ModelID = (
    SELECT ModelID
    FROM SalesDetails
    ORDER BY SalePrice DESC
    LIMIT 1
);
 -- 10th(Find the suppliers of the most commonly used part in the inventory.
 SELECT CompanyName
FROM SupplierDetails
WHERE SupplierID = (
    SELECT PartID
    FROM VehiclePartDetails
    GROUP BY PartID
    ORDER BY COUNT(VIN) DESC
    LIMIT 1
);
