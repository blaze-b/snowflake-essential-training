CREATE OR REPLACE VIEW reviews.PUBLIC.top_businesses
AS
SELECT * FROM
Businesses 
WHERE stars>=4;

select * from reviews.PUBLIC.top_businesses;

---secure-view---
CREATE OR REPLACE SECURE VIEW reviews.PUBLIC.top_businesses_secure
AS
SELECT * FROM
Businesses 
WHERE stars>=4;

select * from reviews.PUBLIC.top_businesses_secure;

SELECT * FROM top_businesses
WHERE 1/iff(city='Cleveland', 0, 1) = 1;

SELECT * FROM top_businesses_secure
WHERE 1/iff(city='Cleveland', 0, 1) = 1;