with
	quantity
	as
	(
		select
			kode_barang,
			sum(
				case 
					when satuan = 'krat' then qty*24
					when satuan = 'dus' then qty*30
					else qty 
				end
			) as qty
		from tr_so
		group by kode_barang
	)
select mp.nama_product, q.qty
from quantity q
	join ms_product mp on mp.kode_produk = q.kode_barang
order by q.qty desc, mp.nama_product asc
limit 3;