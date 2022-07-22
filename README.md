# SNOWFLAKE

- Snowflake is `fully managed` cloud data platform
- It is deployed by the vendor 
- No access to the underlying OS or hardware
- No need for ongoing component adminstration
- Cloud: AWS, Azure, GCP

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

## Billing Model

1. Storage
    - It is Flat rate per terabyte
    - Based on Region Payment Plan
    - Storage Charges: Data + Time Travel + Fail-Safe
    - Time Travel: Enables access to data that has been changed or deleted at any point within a defined period
    - Fail-Safe: Recovery from a catastrophic incident like storage failure, corruption or security breach, It is last resource measure
    - Continuous Data Protection: Active Data(Data is active until it is changes) -> Time Travel (Records stay here for the duration of the Time Travel period(1-90 Days)) -> Automatice Fail-Safe (Records stay here for another 7 days after Time Travel Expiration)
2. Compute Resouces:
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
    
    ![Alt text](./images/VM_SIZES.PNGs)

- The actual monetary cost of a credit depends on the edition of your account

- Multiple Virtual Warehouses

    ![Alt text](./images/MCM.PNG)





