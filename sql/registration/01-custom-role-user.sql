show grants to role "ACCOUNTADMIN";
show grants to role "SECURITYADMIN";
show grants to role "USERADMIN";
show grants to role "SYSADMIN";

-- Create a custom role from sysadmin role
CREATE ROLE "<SUPER_ROLE>" COMMENT = 'DEFAULT SUPER ROLE';
GRANT ROLE "<SUPER_ROLE>" TO ROLE "SYSADMIN";

-- Script to grant all the roles
grant ALL on account to role "<SUPER_ROLE>";
revoke ALL on account from role "<SUPER_ROLE>";

-- Script to grant access from the account level
grant MANAGE GRANTS, CREATE USER, CREATE ROLE, CREATE INTEGRATION, CREATE DATABASE on account to role "<SUPER_ROLE>";
grant MONITOR USAGE on account to role "<SUPER_ROLE>";
revoke MONITOR USAGE on account from role "<SUPER_ROLE>";
show grants to role "<SUPER_ROLE>";

-- Script to grant imported privileges
grant imported privileges on database snowflake to role "<SUPER_ROLE>";
revoke imported privileges on database snowflake from role "<SUPER_ROLE>";

-- Scrip to create a custome warehouse
CREATE WAREHOUSE "<CUSTOM_WAREHOUSE>" WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE 
COMMENT = 'Custom warehouse';
GRANT MODIFY, MONITOR, OPERATE, USAGE ON WAREHOUSE "<CUSTOM_WAREHOUSE>" TO ROLE "<SUPER_ROLE>" WITH GRANT OPTION;

-- Script to create a user for all the ownership access
CREATE USER "user-2" 
PASSWORD = '@@@@@@@@@@@@@@' 
COMMENT = 'Second User' LOGIN_NAME = 'USER2' DISPLAY_NAME = 'USER2' FIRST_NAME = 'USER2' LAST_NAME = 'USER2' 
EMAIL = '<email-id>' DEFAULT_ROLE = "<SUPER_ROLE>" MUST_CHANGE_PASSWORD = FALSE;
GRANT ROLE "<SUPER_ROLE>" TO USER "user-2";