select distinct 
    ft.albumid, 
    ft.artistid, 
    alb.title, 
    alb.cdyear
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb on ft.albumid = alb.albumid
where alb.cdyear > 1