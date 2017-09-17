-- PRIMARY KEY
ALTER TABLE dbo.Product
ADD CONSTRAINT PK_Product
PRIMARY KEY(id);

-- UNIQUE
ALTER TABLE dbo.Product
ADD CONSTRAINT UNQ_Product_serialno
UNIQUE(serialno);

-- FOREIGN KEY
ALTER TABLE dbo.Orders
ADD CONSTRAINT FK_Orders_Employees
REFERENCES dbo.Employees(id)

-- FOREIGN KEY (self-reference)
ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Employees
FOREIGN KEY(managerid)
REFERENCES dbo.Employees(id);

-- CHECK
ALTER TABLE dbo.Employees
ADD CONSTRAINT CHK_Employees_salary
CHECK(salary > 100000.00);

-- DEFAULT
ALTER TABLE dbo.Product
ADD CONSTRAINT DFT_Product_Product
DEFAULT(GETDATE()) FOR dtcr;