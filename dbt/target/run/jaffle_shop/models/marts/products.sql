
  
    

  create  table "postgres"."public"."products__dbt_tmp"
  
  
    as
  
  (
    with

products as (

    select * from "postgres"."public"."stg_products"

)

select * from products
  );
  