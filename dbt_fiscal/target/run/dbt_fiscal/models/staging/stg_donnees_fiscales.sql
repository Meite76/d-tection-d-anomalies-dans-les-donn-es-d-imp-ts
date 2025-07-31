
  create view "fiscal_db"."public"."stg_donnees_fiscales__dbt_tmp"
    
    
  as (
    -- models/staging/stg_donnees_fiscales.sql

with raw as (
    select * from donnees_fiscales_raw
)

select
    id_contribuable,
    lower(nom) as nom,
    lower(prenom) as prenom,
    region,
    revenu_annuel,
    revenu_declare,
    impot_declare,
    depenses,
    charges,
    type_revenu
from raw
  );