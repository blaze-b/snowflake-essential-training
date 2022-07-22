---Script to create the database in the snowflake---
create database reviews;

---SHOW Scripts---
show databases;
show schemas;
show views;

---Warehouse Creating Script---
CREATE WAREHOUSE DATALOAD WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE COMMENT = 'DATA LOADING WAREHOUSE PURPOSE';

---Suspend a Warehouse---
ALTER WAREHOUSE "DATALOAD" SUSPEND;