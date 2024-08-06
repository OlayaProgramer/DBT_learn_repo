-- {{ config(materialized="table") }} esta es la forma de darle la materialización que deseo que tenga este archivo sql

WITH src_hosts AS (
    SELECT 
        host_id,
        NVL(host_name, 'Anonymous') AS host_name,
        is_superhost,
        created_at,
        updated_at
    FROM {{ ref("src_hosts") }}
)

SELECT
    *
FROM src_hosts
