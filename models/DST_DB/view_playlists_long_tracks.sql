select 
    pl.name
from {{ source('DST_DB', 'FACT_TRACK_CD') }} as ft
inner join {{ source('DST_DB', 'BRIDGE_PLAYLISTTRACK_CD') }} as b_pl on ft.trackid = b_pl.trackid
inner join {{ source('DST_DB', 'DIM_PLAYLIST') }} as pl on b_pl.playlistid = pl.playlistid
where ft.durationminutes > 4
group by pl.name