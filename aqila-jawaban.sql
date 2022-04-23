create database adc;
show databases;
use adc;

/* Tabel Buku */
create table buku
(
	id_buku varchar(5),
    judul_buku varchar(100),
    id_penerbit varchar(5),
    kategori_buku varchar(100),
    harga_buku int,
    stok int
);
select*from buku;

/* Tabel Penerbit */
create table penerbit
(
	id_penerbit varchar(5),
    nama_penerbit varchar(50),
    alamat varchar(50),
    telepon varchar(8)
);
select*from penerbit;

/* Data Tabel Buku */
insert into buku (id_buku, judul_buku, id_penerbit, kategori_buku, harga_buku, stok)
values  ('B001', 'Pemrograman Web C#', 'P001', 'Teknologi', 40000, 20),
		('B002', 'Tips dan Trik Excel', 'P002', 'Teknologi', 50000, 25),
        ('B003', 'Pemrograman Deep Learning dengan Python', 'P003', 'Teknologi', 60000, 10),
        ('B004', 'The Daughter of Time', 'P001', 'Fiksi', 30000, 15),
        ('B005', 'Senja dan Pagi', 'P003', 'Fiksi', 20000, 20),
        ('B006', 'A Handbook For Insecurity', 'P002', 'Pengembangan Diri', 45000, 30),
        ('B007', 'Seni Mengatasi Overthinking', 'P001', 'Pengembangan Diri', 25000, 15);
        
/* Data Tabel Penerbit */
insert into penerbit (id_penerbit, nama_penerbit, alamat, telepon)
values  ('P001', 'Erlangga', 'Jakarta', '87986023'),
		('P002', 'Gramedia Pustaka', 'Jakarta', '87985623'),
        ('P003', 'Mizan', 'Jakarta', '87984543');
        
/* Nomor 3 */
select judul_buku, harga_buku, stok, kategori_buku from buku 
where kategori_buku = 'Teknologi'
order by harga_buku;

/* Join */
SELECT buku.id_buku, buku.judul_buku, penerbit.nama_penerbit, buku.harga_buku, buku.stok, 
(harga_buku * stok) as omset_pendapatan
FROM buku
INNER JOIN penerbit
ON buku.id_penerbit = penerbit.id_penerbit;

/* Group by */
select buku.id_penerbit, penerbit.nama_penerbit, SUM(stok) as total_stok_buku
from buku
inner join penerbit 
group by nama_penerbit 
order by sum(stok) desc;