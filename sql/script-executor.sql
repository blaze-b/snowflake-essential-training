SELECT * FROM top_businesses
WHERE 1/iff(city='Cleveland', 0, 1) = 1;