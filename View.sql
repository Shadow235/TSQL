-- Create a View
CREATE VIEW EmployeeView
(id,[givenname],[familyname])
AS
SELECT EmployeeID, FirstName, LastName
FROM Employee;
GO

-- Encrypt view (obfuscating)
CREATE VIEW EmployeeView WITH ENCRYPTION
AS
SELECT EmployeeID, FirstName, LastName
FROM Employee;
GO

-- Drop view
DROP VIEW Employee;
GO