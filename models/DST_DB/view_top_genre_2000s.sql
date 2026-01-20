select 
    ft.genreid, 
    ge.name, 
    count(ft.genreid) as most_listened_genre
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_GENRE') }} as ge on ft.genreid = ge.genreid
inner join {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb on ft.albumid = alb.albumid
inner join {{ source('DST_DB','DIM_TIME') }} as dt on alb.prodyear = dt.prodyear
where dt.prodyear between 2000 and 2010
group by ft.genreid, ge.name
order by most_listened_genre desc
limit 1