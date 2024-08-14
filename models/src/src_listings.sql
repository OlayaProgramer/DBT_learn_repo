WITH raw_listings AS (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)

SELECT 
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings

-- important not put semicolons in this sentence because them will be generated problems later when you run this command "dbt run"