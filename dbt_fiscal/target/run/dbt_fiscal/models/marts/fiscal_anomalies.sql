
  
    

  create  table "fiscal_db"."public"."fiscal_anomalies__dbt_tmp"
  
  
    as
  
  (
    -- fiscal_anomalies.sql
with base as (
    select * from "fiscal_db"."public"."stg_donnees_fiscales"
),

anomalies as (
    select
        *,
        case
            when revenu_declare < revenu_annuel * 0.7 then 1 else 0
        end as flag_sous_declaration,
        case
            when impot_declare < revenu_declare * 0.2 then 1 else 0
        end as flag_impot_bas
    from base
)

select * from anomalies
where flag_sous_declaration = 1 or flag_impot_bas = 1
  );
  