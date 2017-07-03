-- Create a schema
CREATE SCHEMA Reporting AUTHORIZATION dbo; -- [dbo] - user (database owner)
GO

-- Add Table to schema
CREATE TABLE Reporting.NewTable (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY
);
GO