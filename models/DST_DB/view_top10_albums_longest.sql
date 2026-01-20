select 
    alb.artistid,
    alb.title, 
    count(ft.trackid) as nombre_de_pistes,
    sum(ft.durationminutes) as duration_totale,
    avg(ft.durationminutes) as moyenne_par_piste
from {{ source('DST_DB', 'DIM_ALBUM_CD') }} as alb
inner join {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft on alb.albumid = ft.albumid
group by alb.artistid, alb.albumid, alb.title
having count(ft.trackid) > 0
order by duration_totale desc
limit 10