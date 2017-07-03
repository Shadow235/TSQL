-- 1. Simple Table
CREATE TABLE dbo.Customer
(
    ID BIGINT IDENTITY(1,1),
    [Name] VARCHAR(100)
);
GO

-- 2. Primary Key
CREATE TABLE dbo.Customer
(
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(100)
);
GO

-- 3. Foreign Key
CREATE TABLE dbo.CustomerOrder
(
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    CustomerID BIGINT NOT NULL FOREIGN KEY REFERENCES dbo.Customer (ID), -- name of constraint is automatically generated
    OrderAmount DECIMAL(18,2) NOT NULL
);
GO

-- 4. Foreign Key with constraint name
CREATE TABLE dbo.CustomerOrderx
(
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    CustomerID BIGINT NOT NULL CONSTRAINT FK_CustomerOrderx_Customer REFERENCES dbo.Customer (ID),
    OrderAmount DECIMAL(18,2) NOT NULL
);
GO

-- 5. Remove Constraint
ALTER TABLE dbo.CustomerOrder
DROP CONSTRAINT FK_CustomerOrderx_Customer
GO

-- 6. Add Foreign Key via ALTER TABLE
ALTER TABLE dbo.CustomerOrder
    ADD CONSTRAINT FK_CustomerOrder_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES dbo.Customer (ID)
GO