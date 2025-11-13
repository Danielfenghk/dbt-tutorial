
  create view "postgres"."public"."stg_customers__dbt_tmp"
    
    
  as (
    with

source as (

    select * from "postgres"."raw"."raw_customers"

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        name as customer_name

    from source

)

select * from renamed
  );