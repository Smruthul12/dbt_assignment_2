{{
    config(
        materialized='view'
    )
}}

WITH raw_listings AS (
    SELECT
        *
    FROM
        {{ source('airbnb','RAW_LISTINGS') }}
)
SELECT
    id AS listing_id,
    name AS listing_name,
    host_id,
    host_name,
    price,
    neighbourhood,
    latitude,
    longitude,
    room_type,
    minimum_nights,
    number_of_reviews,
    last_review,
    reviews_per_month,
    calculated_host_listings_count,
    availability_365,
    number_of_reviews_ltm,
FROM
    raw_listings
