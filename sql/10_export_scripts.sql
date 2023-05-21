use reviews;

-- Copy as a parquet file
COPY INTO @Azure_DataLake/reviews/topbusiness.parquet
FROM (SELECT * FROM top_businesses LIMIT 100)
FILE_FORMAT=(type=parquet) SINGLE=TRUE;

COPY INTO @Azure_DataLake/reviews/topbusiness.csv
FROM (SELECT * FROM top_businesses LIMIT 100)
FILE_FORMAT=(TYPE=csv COMPRESSION = NONE) SINGLE=TRUE HEADER=TRUE;
                    
                    
list @Azure_DataLake/reviews/;

select file.$1, file.$2, file.$3, file.$4, file.$5, file.$6
from @Azure_DataLake/reviews/topbusiness.csv (file_format => CSVFORMAT_QUOTES) file
LIMIT 10;

CREATE OR REPLACE FILE FORMAT PARQUET_FORMAT TYPE = 'parquet' COMPRESSION = 'AUTO' 
COMMENT = '#' BINARY_AS_TEXT = TRUE;

select file.$1
from @Azure_DataLake/reviews/topbusiness.parquet (file_format => PARQUET_FORMAT) file
LIMIT 10;

select file.$1:_COL_0::varchar
from @Azure_DataLake/reviews/topbusiness.parquet (file_format => PARQUET_FORMAT) file
LIMIT 10;

select file.$1:_COL_1::varchar
from @Azure_DataLake/reviews/topbusiness.parquet (file_format => PARQUET_FORMAT) file
LIMIT 10;