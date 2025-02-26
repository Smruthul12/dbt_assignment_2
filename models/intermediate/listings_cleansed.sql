{{
    config(
        materialized='view'
    )
}}

WITH listings_cleaned AS (
    SELECT
        listing_id,
        listing_name,
        host_id,
        COALESCE(host_name, 'Unknown') AS host_name,  
        COALESCE(price, 0) AS price,  
        neighbourhood,
        latitude,
        longitude,
        room_type,
        minimum_nights,
        number_of_reviews,
        COALESCE(last_review, '1900-01-01') AS last_review,  
        COALESCE(reviews_per_month, 0) AS reviews_per_month,  
        calculated_host_listings_count,
        availability_365,
        number_of_reviews_ltm
    FROM {{ ref('src_listings') }}
)

SELECT * FROM listings_cleaned
