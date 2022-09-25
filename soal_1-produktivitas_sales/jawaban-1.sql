with
	so_sales
	as
	(
		select distinct no_so, kode_sales
		from tr_so ts
	),
	jumlah_so
	as
	(
		select kode_sales, count(*) jumlah_so
		from so_sales ss
		group by kode_sales
	)
select
	mp.nama_pegawai,
	js.jumlah_so,
	mp.target,
	case 
		when js.jumlah_so >= mp.target then 'tidak'
		else 'ya'
	end as kurang_dari_target
from ms_pegawai mp join jumlah_so js on mp.kode_pegawai = js.kode_sales
order by mp.nama_pegawai asc;