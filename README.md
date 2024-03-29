# SNOWFLAKE

- Snowflake is a `fully managed` cloud data platform
- It is deployed by the vendor 
- No access to the underlying OS or hardware
- No need for ongoing component adminstration
- Cloud: AWS, Azure, GCP
- Service
  - Storage seperated from compute
  - Multiple compute clusters("Virtual Warehouses")
  - Virtual warehouses concurrently access data without connection
  - Centralized management
  - Metadata seperate from storage and compute
  - Full transactional consistency across entire system.

## Platform

- Data Warehouse
- Data Lake
- Data Processing
- Data Sharing

## Snowflake Ecosystem

- Core Services:
    1. Virtual Warehouses: Cluster of compute resources that executes database queries and commands
    2. Snowpipe

- Tools:
    1. Web portal
    2. Command line interface - SnowSQL
    3. Connectors and drivers

- Connectors:
    1. Python
    2. Spark
    3. Kafka

- Drivers:
    1. Node.js
    2. Go
    3. .NET
    4. JDBC
    5. OBBC

- 3rd Party Applications:
    1. Power BI
    2. tableau
    3. salesforce
    4. looker

 ![Alt text](./images/snowflake_ecosystem.JPG)

## Billing Model

1. Storage
    - It is `Flat rate per terabyte`
    - Based on `Region Payment Plan`
    - Storage Charges: `Data + Time Travel + Fail-Safe`
        - Time Travel: Enables access to data that has been changed or deleted at any point within a defined period
        - Fail-Safe: Recovery from a catastrophic incident like storage failure, corruption or security breach, It is last resource measure
        - Continuous Data Protection: Active Data(Data is active until it is changes) -> Time Travel (Records stay here for the duration of the Time Travel period(1-90 Days)) -> Automatice Fail-Safe (Records stay here for another 7 days after Time Travel Expiration)
2. Compute Resources:
    - Number and size of virtual warehouses
    - Serverless features: `Snowpipe`, `Background table mainternance`, `Database replication`
    - Cloud services: `Authentication and Authorization`, `Infrastructure management`, `Query parsing and optimization`
3. Data transfer

## Snowflake Credit:

Unit to measure to pay for compute resources
    
## Snowflake Editions:

1. Standard: 
    1. SQL data warehouse engine
    2. Encryption in transit and at rest
    3. All system tools available
    4. One day of time-travel
    
2. Enterprise
    1. Standard+
    2. Materialized views, data masking, point-lookup optimization
    3. Multi-Cluster warehouses
    4. Periodic rekey of encryption
    5. Up to 90 days of Time-Travel
        
3. Business Critical
    1. Enterprise
    2. HIPAA and PCI support
    3. Customer-Managed keys
    4. AWS and Azure Private links
    5. Disaster recovery failover and failback
    
4. Virtual Private Snowflake
    1. Business Critical+
    2. Dedicated metadata store and pool of virtual servers
    3. Isolated environment from all other snowflake accounts

## Cost

![Alt text](./images/credits.PNG)


## Architecture

- Massively Parallel Processing Database Engine
    
    ![Alt text](./images/MVP.PNG)

- Decoupled Compute and Storage

    ![Alt text](./images/DCS.PNG)

- Tight integration with cloud storage

    ![Alt text](./images/ICS.PNG)


## Virtual Warehouse

- Operations: 

    ![Alt text](./images/Operations.PNG)

- Executing DDL does not always require an active Virtual Warehouse

- It has procedure for the automatic operations

- It provides the Flexibility and Elasticity

    ![Alt text](./images/VW.PNG)

- Size 
    
    ![Alt text](./images/VM_SIZES.PNG)

- The actual monetary cost of a credit depends on the edition of your account

- Multiple Virtual Warehouses

    ![Alt text](./images/MCM.PNG)

- Multi-Cluster Warehouses

    ![Alt text](./images/MCW.PNG)


## Tables

![Alt text](./images/Tables.PNG)

- Table Storage
    
    ![Alt text](./images/table1.PNG)
    
    1. Micro Partitions:
        1. Automatic partitioning scheme
        2. 50MB-500MB in size
        3. Compressed columnar storage
        4. Pruned during query execution
    2. Clusteting key
        1. Tables 1TB+
        2. Orderes the micro-partition records based on the key
        3. Automatically maintained by Snowflake
        4. Useful for range and equqlity predicates on the key
    3. Search Optimization Service
        1. Serverless feature
        2. Enterprise edition
        3. Table-level property

## Constaints:

![Alt text](./images/constraints.PNG)

Not Null is enforced

## Data Types

![Alt text](./images/data-types.PNG)

## Views

![Alt text](./images/views.PNG)

## Code Modules

- User Defined Functions
- External Functions
- Stored procedures
- Modules can be coded in SQL or JavaScript


## SnowSQL

- Installation: https://docs.snowflake.com/en/user-guide/snowsql-install-config
- Run command: `snowsql -a <account-name> -u <login-name>`
- Add the account-name, username and passord in the ./snowsql/config file
  
   ![Alt text](./images/snowsql-config.JPG)

- Run: `snowsql`

## File Formats

- Supported file formats

    ![Alt text](./images/file_formats.JPG)


- Options:
   
    ![Alt text](./images/file_options.JPG)


- Best Practices
  - Loading virtual warehouses
  - 10 to 100 MB compressed
  - Aggregate or split data to get this range
  - Seperate the files by folders with source and date information
  
## Import data

 - Web portal
 - Copy command
 - Snowpipe

## Import data through the load button

### Data Stage

 - It is used for loading data from files into Snowflake tables and unloading data into files
 - Types: Internal: Storaged and managed by snowflake, External: s3, azure, gcp storage
 - Internal Stages: User Stage, Table Stage, Named Stage   
 - [Scripts](./sql/08_copy_stage_scripts.sql)
 - Import Process
    
    ![Alt text](./images/import_process.JPG)


### Snowpipe

 - Continuous data loading
 - Severless feature
 - Same file best practices
 - Recommended 1 minute cadence
 - [Script](./sql/09_snowpipe_scripts.sql)


 ## Exporting data from snowflake

 - Export Process [Script](./sql/10_export_scripts.sql)

    ![Alt text](./images/export_process.JPG)


## Security Model

 - Access Control
  
  ![Alt text](./images/access_control.JPG)


 - Users can temporarily assume the permissions of any of their roles when necessary.

 - Role activation can be done through USE ROLE Command and Web Portal

 - Built-In Roles: ACCOUNTADMIN, SECURITYADMIN, SYSADMIN, USERADMI, PUBLIC<AUTO>

 - Securables,

 ![Alt text](./images/securables.JPG)

 - Securbles: Virtual Warehouses, Users, Integrations

 - [Scripts](./sql/11_user_role_scripts.sql)


## [Sample Query Scripting](./sql/12_querying_scripts.sql)

## [Monitoring](./sql/13_monitoring_scripts.sql)

 - Monitoring involves virtual warehouse and query usages.




 





