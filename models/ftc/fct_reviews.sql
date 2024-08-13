{{ 
config(
    materialized = "incremental",
    on_schema_change = "fail"
)}}

WITH src_reviews AS (
    SELECT 
        *
    FROM 
        {{
            ref("src_reviews")
        }}
)

SELECT
    *
FROM
    src_reviews
WHERE
    review_text IS NOT null
{%  if is_incremental() %}
    AND review_date > (
        SELECT 
            MAX(review_date)
        FROM
            {{
                this
            }}
    )
{% endif %}

-- When I put in the command next flag "--full-refresh" all data is recreated again
-- Sample: dbt run --full-refresh
