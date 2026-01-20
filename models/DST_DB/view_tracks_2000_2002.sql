select distinct 
    ft.trackid, 
    ft.artistid, 
    ft.albumid, 
    ft.name, 
    ft.composer, 
    dt.prodyear, 
    alb.cdyear, 
    era
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb on ft.albumid = alb.albumid
inner join {{ source('DST_DB','DIM_TIME') }} as dt on alb.prodyear = dt.prodyear
where dt.prodyear between 2000 and 2002