select 
    alb.artistid, 
    art.name, 
    count(alb.albumid) as album_produced
from {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb
inner join {{ source('DST_DB', 'DIM_ARTIST') }} as art on alb.artistid = art.artistid
group by alb.artistid, art.name