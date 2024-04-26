{{ config(materialized='table') }}
with source_data as (
 SELECT
    t1.year,
    Industry_name_NZSIOC AS industry_name,
    variable,
    t1.value AS Value
FROM survey2 t2 left join survey1 t1
ON t1.id = t2.id )select * from source_data
