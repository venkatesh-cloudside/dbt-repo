{{config(materialized= 'table')}}

with source_data as ( SELECT 
    id,
    year,
    variable,
    encode(digest(variable::bytea, 'sha256'), 'hex') AS hashed_id,
    value 
FROM 
    survey1 
WHERE 
    year in (2013,2015)) select * from source_data
