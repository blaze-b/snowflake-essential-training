-- Run the scripts in the SNOWSQL command line
use Reviews;
select * from businesses limit 5;

!source snowsql\CREATE_TABLE_SNOWSQL.txt
!define cityName='Las Vegas'
!set variable_substitution=true
select * from top_businesses where city='&cityName';
!set variable_substitution=false
select * from top_businesses where city='&cityName';
!define partialName='Las '
!set variable_substitution=true
select * from top_businesses where city='&{partialName}Vegas';

!variables
!spool snowsql\results.txt
select * from businesses limit 5;

-- Exports the file to the details
!spool off
!set output_format=csv
!set header=false
!set timing=false
!spool snowsql\results.csv
select * from businesses limit 5;
!spool off
!queries session
-- Query id to be passed 01abd349-0000-5e7b-0000-000109f6216d
!result ****************************
!quit