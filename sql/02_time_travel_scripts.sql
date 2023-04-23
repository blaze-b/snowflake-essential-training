use DATABASE reviews;

use WAREHOUSE dataload;

-- Select Script
SELECT * FROM reviews.PUBLIC.BUSINESSES;

---Time Travel---
ALTER SESSION  SET TIMEZONE = 'UTC';

SELECT getdate(); -- Output: 2022-07-25 07:34:17.620 +0000	

DELETE FROM reviews.PUBLIC.BUSINESSES WHERE City='Las Vegas';

SELECT * from reviews.PUBLIC.BUSINESSES WHERE City='Las Vegas'

SELECT * from reviews.PUBLIC.BUSINESSES at(timestamp => '2022-07-25 07:34:17.620 +0000'::timestamp) WHERE City='Las Vegas';

INSERT INTO reviews.PUBLIC.BUSINESSES
SELECT * from reviews.PUBLIC.BUSINESSES at(timestamp => '2022-07-25 07:34:17.620 +0000'::timestamp)
WHERE City='Las Vegas';