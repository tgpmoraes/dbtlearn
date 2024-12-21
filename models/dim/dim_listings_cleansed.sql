{{
    config(
        materialized = 'view'
    )
}}

WITH src_listings AS (
    SELECT * FROM {{ ref("src_listings") }}
)
SELECT 
  listing_id,
  listing_name,
  room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  CAST(regexp_replace(
    price_str, '[^0-9.]', ''
   ) AS FLOAT64) AS price,
  created_at,
  updated_at
FROM
  src_listings