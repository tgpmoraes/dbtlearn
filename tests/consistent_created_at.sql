WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
dim_listings_cleansed AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
)
SELECT
    *
FROM fct_reviews r
INNER JOIN
dim_listings_cleansed lc
ON r.listing_id = lc.listing_id
WHERE r.review_date < lc.created_at