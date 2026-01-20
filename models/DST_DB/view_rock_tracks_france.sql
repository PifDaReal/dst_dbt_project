select distinct 
    ft.trackid, 
    ft.artistid, 
    ft.name, 
    ge.name as genre_name, 
    art.country
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_ARTIST') }} as art on ft.artistid = art.artistid
inner join {{ source('DST_DB', 'DIM_GENRE') }} as ge on ft.genreid = ge.genreid
where art.country like '%France' and ft.genreid = 1