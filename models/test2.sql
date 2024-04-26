{{ config(materialized='table') }}
with source_data as (
   SELECT
  id,
  MAX(year) as Year,
  MAX(industry_code_ANZSIC) as Industry_code_ANZSIC,
  MAX(industry_name_ANZSIC) as Industry_name_ANZSIC,
  MAX(rme_size_grp) as rme_size_GRP,
  MAX(variable) as Variable,
  MAX(value) as Value,
  MAX(unit) as units,
  MAX(serial_number) as S_NO,
  MAX(serial_number_1) as S_No2
FROM survey1
GROUP BY
  id


UNION ALL


SELECT
  id,
  MAX(Year) as Year,
  MAX(Industry_code_ANZSIC06) as Industry_code_ANZSIC,
  MAX(Industry_name_NZSIOC) as Industry_name_ANZSIC,
  MAX(Units) as rme_size_GRP,
  MAX(Variable_name) as Variable,
  MAX(Value) as Value,
  MAX(Units) as units,
  MAX(serial_number) as S_NO,
  MAX(serial_number_1) as S_NO2
FROM survey2
GROUP BY
  id )select * from source_data
