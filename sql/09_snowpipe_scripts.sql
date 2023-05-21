use REVIEWS;

show databases;

create or replace TABLE REVIEWS (
	REVIEW_ID VARCHAR(100),
	BUSINESS_ID VARCHAR(100),
	USER_ID VARCHAR(100),
	STARS NUMBER(38,4),
	USEFUL NUMBER(38,4),
	REVIEW_DATE DATE
);

create or replace stage Azure_DataLake URL = 'azure://snowflakecourse.blob.core.windows.net/snowflake-stage'
CREDENTIALS = (AZURE_SAS_TOKEN = '*************************************************');

-- Since no azure connection for the external stage using the internal named staged for connection
CREATE OR REPLACE STAGE Azure_DataLake 
file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"')
directory = (enable = true);


put file://snowsql\reviews\*.csv @Azure_DataLake/reviews;

show stages;

list @Azure_Datalake;

create or replace file format CSVFORMAT_QUOTES TYPE = 'CSV' FIELD_DELIMITER = ',' FIELD_OPTIONALLY_ENCLOSED_BY='"';


select file.$1, file.$2, file.$3, file.$4, file.$5, file.$6
from @Azure_DataLake/reviews/reviews1.csv (file_format => CSVFORMAT_QUOTES) file
LIMIT 10;

select file.$1, file.$2, file.$3, file.$4, file.$5, file.$6
from @Azure_DataLake/reviews/reviews2.csv (file_format => CSVFORMAT_QUOTES) file
LIMIT 10;

create or replace pipe reviews_pipe as
copy into reviews from @Azure_DataLake/reviews/
file_format = CSVFORMAT_QUOTES;

select count(*) from reviews;

select * from reviews;

select system$pipe_status('reviews_pipe');

alter pipe reviews_pipe refresh;
    
select * from table(information_schema.copy_history(table_name=>'reviews', start_time=> dateadd(hours, -1, current_timestamp())));
