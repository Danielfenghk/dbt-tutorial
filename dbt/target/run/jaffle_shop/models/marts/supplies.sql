
  
    

  create  table "postgres"."public"."supplies__dbt_tmp"
  
  
    as
  
  (
    with

supplies as (

    select * from "postgres"."public"."stg_supplies"

)

select * from supplies
  );
  