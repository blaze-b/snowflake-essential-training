---Script to create the database in the snowflake---
CREATE DATABASE reviews;

---SHOW Scripts---
SHOW DATABASES;
SHOW SCHEMAS;
SHOW VIEWS;

---Warehouse Creating Script---
CREATE WAREHOUSE DATALOAD WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE COMMENT = 'DATA LOADING WAREHOUSE PURPOSE';

---Suspend a Warehouse---
ALTER WAREHOUSE "DATALOAD" SUSPEND;

-- Script to switch to the database
USE DATABASE reviews;

CREATE OR REPLACE TABLE reviews.PUBLIC.BUSINESSES (
    BUSINESS_ID VARCHAR(100),
    NAME VARCHAR(100),
    CITY VARCHAR(50),
    STATE VARCHAR(2),
    REVIEW_COUNT NUMBER(38,4),
    STARS NUMBER(38,4)
);

-- Insert scripts
INSERT INTO reviews.PUBLIC.BUSINESSES VALUES
('QNcv3mwnHJ5w4YB4giqkWw','Preferred Veterinary Care','Pittsburgh','PA',4,3.5),
('oZG8sxDL54ki9pmDfyL7rA','Not My Dog','Toronto','ON',9,3.5),
('S06JfRM3ICESOHc1pr3LOA','Chase Bank','Las Vegas','NV',3,5.0),
('NL_BfZ4BkQXJSYAFouJqsQ','24 hr lockouts','Las Vegas','NV',3,1.0),
('AnUyv2zHq_35gCeHr8555w','Soma Restaurant','Las Vegas','NV',12,3.0),
('jjBTBObnHrY87qQIMybjzQ','Blue Jade','Cleveland','OH',24,3.5),
('PhL85G9Y6OstQzThDIllMQ','Animalerie Little Bear','Westmount','QC',9,4.0),
('SkRqx-hxVPLgV4K5hxNa9g','Parkview Dental Associates','Sun Prairie','WI',4,3.0),
('tWX7j4Qg4cXofQqmoNKH3A','Sir Hobbs','Sun Prairie','WI',35,3.0),
('4a9Rypytzdz9NZuGMS2ZYw','Rogue Bar','Scottsdale','AZ',80,3.5),
('oYWy-hOTCOF7h8DCAZ_Mxw','Cool Girl','Toronto','ON',48,3.5),
('AMxxi7jyxhcdNF7FIRbUVA','Remington''s Restaurant','Scottsdale','AZ',103,3.0),
('d01d-w7pxHrMCX5mDwaaHQ','D Liche','Montréal','QC',89,4.5),
('66DKb6APF96InEKrUVIbZw','Allo Inde','Montréal','QC',3,3.5);
