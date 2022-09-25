select
	convert(REGEXP_SUBSTR(s.strdata, '\\d{4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])'), date
) tanggal,
	convert
(case 
		when REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*lusin)') then REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*lusin)')*12
		else REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*buah)')*1
end, signed) qty,
	convert
(case 
		when REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*lusin)') 
			then REGEXP_SUBSTR
(s.strdata, '(?<=Rp )(\\d+)')/
(REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*lusin)')*12)
		else REGEXP_SUBSTR
(s.strdata, '(?<=Rp )(\\d+)')/REGEXP_SUBSTR
(s.strdata, '(\\d+)(?=\\s*buah)')
end, signed) harga_satuan,
	convert
(REGEXP_SUBSTR
(s.strdata, '(?<=Rp )(\\d+)')*1, signed) total
from strdata s;