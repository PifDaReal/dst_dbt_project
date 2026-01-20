select 
    alb.artistid, 
    art.name, 
    count(ft.trackid) as track_produced
from {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb
inner join {{ source('DST_DB', 'DIM_ARTIST') }} as art on alb.artistid = art.artistid
inner join {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft on alb.albumid = ft.albumid
group by alb.artistid, art.name