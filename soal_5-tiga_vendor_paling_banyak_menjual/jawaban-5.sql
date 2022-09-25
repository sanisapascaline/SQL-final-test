select
	mv.vendor,
	sum(
		case 
			when satuan = 'krat' then ts.qty*24*mp.harga_satuan 
			when satuan = 'dus' then ts.qty*30*mp.harga_satuan 
		else ts.qty*mp.harga_satuan 
		end
		) as amount
from tr_inv ti
	join tr_do td on td.no_entry_do = ti.no_entry_do
	join tr_so ts on ts.no_entry_so = td.no_entry_so
	join ms_product mp on ts.kode_barang = mp.kode_produk
	join ms_vendor mv on mp.kode_vendor = mv.kode_vendor
group by mv.vendor
order by 2 desc, 1 asc
limit 3;
