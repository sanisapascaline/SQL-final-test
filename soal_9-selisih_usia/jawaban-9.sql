with
    usia
    as

    (
        select nama, DATEDIFF(tanggal_registrasi, tanggal_lahir) as usia
        from people
        order by 2 desc
    ),
    lagged
    as
    (
        select
            nama,
            LEAD(nama, 1) OVER (
        ORDER BY usia desc
    ) nama_sebelum,
            usia,
            LEAD(usia, 1) OVER (
        ORDER BY usia desc
    ) usia_sebelum

        from
            usia
    )
select nama_sebelum as nama1, nama as nama2, usia - usia_sebelum as selisih
from lagged
where nama_sebelum is not null
order by 3 asc
limit 1;