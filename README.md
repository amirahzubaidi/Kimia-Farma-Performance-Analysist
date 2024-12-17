### Kimia-Farma-Performance-Analysist
#### Project Portfolio

##### Latar Belakang
Sebagai Big Data Analytics Intern di Kimia Farma, Anda bertugas mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023. Fokus utama adalah memahami tren bisnis dan memberikan wawasan strategis untuk peningkatan performa operasional.

##### Data Yang Tersedia 
kf_final_transaction.csv: Data transaksi pelanggan.
kf_inventory.csv: Data inventaris produk.
kf_kantor_cabang.csv: Informasi cabang Kimia Farma.
kf_product.csv: Data produk obat.

##### Problem Statement
Bagaimana menganalisis kinerja bisnis Kimia Farma berdasarkan transaksi, inventaris, dan data cabang untuk:
-Mengidentifikasi tren pendapatan dari tahun ke tahun.
-Menilai performa cabang berdasarkan transaksi dan kepuasan pelanggan.
-Memberikan rekomendasi strategis berbasis data untuk pertumbuhan bisnis.
Langkah utama mencakup import data ke BigQuery, membuat tabel analisis, serta mengembangkan dashboard kinerja di Google Looker Studio yang mencakup berbagai visualisasi seperti perbandingan pendapatan, top cabang, dan analisis profitabilitas. 
Berikut link untuk akses Google Looker Studio : https://lookerstudio.google.com/reporting/bb018011-8091-4b7d-93ec-610f162ee281

##### Tujuan Membuat Tabel Analisa
-Konsolidasi Data: Semua informasi dari dataset yang berbeda berada dalam satu tabel.
-Sumber Data Tunggal: Mempermudah query untuk berbagai keperluan analisis.
-Dasar Dashboard: Memberikan data yang terstruktur untuk digunakan dalam visualisasi di Google Looker Studio.

##### Asal Data Untuk Tabel Analisa
Tabel ini dibuat dengan menggabungkan data dari:
kf_final_transaction: Berisi detail transaksi.
kf_kantor_cabang: Berisi informasi cabang.
kf_product: Berisi informasi produk.
kf_inventory (opsional jika relevan): Berisi stok produk.

##### Penjelasan SQL 
1.Kolom Utama:
transaction_id, date, branch_id, dan customer_name berasal dari tabel transaksi.
branch_name, kota, provinsi, dan rating_cabang berasal dari tabel kantor cabang.
product_id dan product_name berasal dari tabel produk.
2. Kalkulasi Kolom Tambahan:
discount_percentage: Menghitung persentase diskon berdasarkan harga awal (original_price) dan harga aktual (actual_price).
persentase_gross_laba: Menentukan persentase laba berdasarkan kategori harga.
nett_sales: Menggunakan actual_price sebagai harga bersih setelah diskon.
nett_profit: Menghitung keuntungan berdasarkan nett_sales dan persentase laba.
3. Penggabungan Dataset:
Menggunakan JOIN untuk menggabungkan tabel transaksi (kf_final_transaction), tabel kantor cabang (kf_kantor_cabang), dan tabel produk (kf_product) berdasarkan kolom relasi.
4. Hasil: Tabel ini siap digunakan untuk berbagai analisis seperti kinerja cabang, produk, dan transaksi.
