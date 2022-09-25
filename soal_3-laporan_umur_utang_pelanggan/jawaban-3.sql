select
	td.no_do,
	mc.nama_customer,
	convert(td.tgl_do, date) tgl_do,
	convert('2018-02-01', date) date_measurement,
	datediff('2018-02-01', td.tgl_do) aging
from tr_do td
	join tr_so ts on td.no_entry_so = ts.no_entry_so
	join ms_customer mc on ts.kode_customer = mc.kode_customer
where td.no_entry_do not in (select no_entry_do
from tr_inv)
order by aging desc, td.no_do asc;