
  
    

  create  table "postgres"."public"."locations__dbt_tmp"
  
  
    as
  
  (
    with

locations as (

    select * from "postgres"."public"."stg_locations"

)

select * from locations
  );
  