-- Run the scripts from the snowsql
use Reviews;

use warehouse dataload;

CREATE OR REPLACE TABLE USERS(
  USER_ID VARCHAR(100),
  NAME VARCHAR(100),
  REVIEW_COUNT NUMBER(38,4),
  USEFUL NUMBER(38,4),
  FANS NUMBER(38,4),
  AVERAGE_STARS NUMBER(38,4),
  JOINED_DATE DATE
);

show tables;

-- Automatice gz conversion of the file occurs

-- Adding to the users stage
put file://snowsql\users.csv @~/staged;

list @~;

list @~/staged;

-- Adding to the tables stage
put file://snowsql\users.csv @%users/staged;

list @%users;

-- Adding to the named stage
CREATE OR REPLACE STAGE shared_stage file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"')
directory = (enable = true); 

show stages;

put file://snowsql\users.csv @shared_stage/staged;

list @shared_stage;

copy into users from @~/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

copy into reviews from @%users/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

copy into users from @~/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1) ON_ERROR=CONTINUE;

-- Script to check the errors that is caused during runtime
select * from table(validate(users, job_id => '_last'));

truncate table users;

copy into users from @~/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1) VALIDATION_MODE = 'RETURN_ERRORS';

copy into users from @~/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"') purge=true;

list @~;

select * from users limit 10;

truncate table users;

copy into users from @shared_stage/staged purge=true;

truncate table users;

copy into users from @%users/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

list @%users;

remove @%users/staged/;

select * from table(information_schema.copy_history(table_name=>'users', start_time=> dateadd(hours, -1, current_timestamp())));