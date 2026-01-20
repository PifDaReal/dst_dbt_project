select 
    ge.name, 
    floor(avg(ft.bytes) / 1048576) as avg_size_mb
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'DIM_GENRE') }} as ge on ft.genreid = ge.genreid
group by ge.name