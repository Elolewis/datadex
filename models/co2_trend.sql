with source as (
      select * from {{ source('github', 'co2_trend_gl') }}
),
renamed as (
    select
        make_date(year, month, day) as date,
        year < 2020 as d,
        *
    from source
    order by 1 asc
)
select * from renamed
