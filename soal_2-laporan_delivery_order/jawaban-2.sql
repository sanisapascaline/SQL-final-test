with quantity as (
	select 
		no_entry_so,
		kode_customer,
		kode_barang,
		case 
			when satuan = 'krat' then qty*24
			when satuan = 'dus' then qty*30
			else qty 
		end as qty
	from tr_so
) select 
	td.no_do,
	q.kode_customer,
	td.tgl_do as tgl_do,
	convert(q.qty, SIGNED) as qty,
	convert(round((qty * mp.harga_satuan)*(110/100) + mc.ongkos_kirim), signed) as amount
from tr_do td 
join quantity q on q.no_entry_so = td.no_entry_so 
join ms_product mp on q.kode_barang = mp.kode_produk 
join ms_customer mc on q.kode_customer = mc.kode_customer 
order by td.no_do;