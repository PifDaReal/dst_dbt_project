select distinct 
    ft.trackid, 
    ft.artistid, 
    ft.genreid, 
    ge.name as genre_name, 
    ft.name as track_name, 
    ft.composer, 
    dt.prodyear, 
    alb.cdyear, 
    era
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb on ft.albumid = alb.albumid
inner join {{ source('DST_DB','DIM_TIME') }} as dt on alb.prodyear = dt.prodyear
inner join {{ source('DST_DB', 'DIM_GENRE') }} as ge on ft.genreid = ge.genreid
where ge.genreid in (1, 2)