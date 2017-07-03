-- Create a partition function
-- [RIGHT] - how to handle values that are the same as boundary values (right or left)
CREATE PARTITION FUNCTION PF (int) AS RANGE RIGHT FOR VALUES (20000101, 20010101, 20020101);

-- Create scheme
-- mapping to filegroups for the partitions created by a partition function
CREATE PARTITION SCHEME PS AS PARTITION PF TO (FG0000, FG2000, FG2001, FG2002, FG2003);

-- Create Table on partition
CREATE TABLE dbo.order_table
 (datekey int, amount int)
ON PS(datekey);
GO

-- Split Partitions
ALTER PARTITION FUNCTION PF() SPLIT RANGE(20030101);
GO

-- Merge Partitions
ALTER PARTITION FUNCTION PF() MERGE RANGE (20000101);
GO

-- Switch Partitions
ALTER TABLE dbo.order_table SWITCH PARTITION $PARTITION.PF(20000101) TO dbo.archive_staging_table 
GO