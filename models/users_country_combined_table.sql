--select * from {{source("source table's info", "raw_users")}}
--select * from {{source("source table's info", "raw_country")}}
{{config(materialized='table')}}

select
    ru.id,
    ru.user,
    rc.country as countryname
from
    {{ source("source table's info", 'raw_users') }} ru
left join
    {{ source("source table's info", 'raw_country') }} rc
on
    ru.country = rc.country_id
