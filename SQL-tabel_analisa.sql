SELECT
    t.transaction_id, -- Mengambil ID unik untuk setiap transaksi dari tabel kf_final_transaction
    t.date,  --Mengambil tanggal transaksi.
    t.branch_id,  --Mengambil ID cabang tempat transaksi terjadi.
    c.branch_name,  --Nama cabang diambil dari tabel kf_kantor_cabang.
    c.kota,  --Kota lokasi cabang.
    c.provinsi,  --Provinsi lokasi cabang.
    c.rating AS rating_cabang,  -- Memberi label untuk nilai rating cabang sebagai rating_cabang
    t.customer_name,  --Nama pelanggan yang melakukan transaksi.
    t.product_id,  --ID produk yang dibeli pelanggan
    p.product_name,  --Nama produk diambil dari tabel kf_product.
    p.price AS actual_price,  --Harga asli produk diberi alias sebagai actual_price.
    t.discount_percentage,  -- Persentase diskon yang diberikan untuk produk pada transaksi tertentu.
   
   --Menghitung Persentase Gross Laba
    CASE  --Membagi kategori persentase laba kotor berdasarkan harga produk (p.price).
        WHEN p.price <= 50000 THEN 10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 25
        ELSE 30
    END AS persentase_gross_laba,  --Alias untuk kolom yang menyimpan persentase laba.
    
    --Menghitung Nett Sales
    p.price * (1 - t.discount_percentage / 100) AS nett_sales,  -- Menghitung penjualan bersih setelah diskon diterapkan. nett sales = Alias untuk kolom yang menyimpan nilai penjualan bersih.
    
    --Menghitung Nett Profit
    (p.price * (1 - t.discount_percentage / 100)) * (
        CASE
            WHEN p.price <= 50000 THEN 0.1
            WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
            WHEN p.price > 100000 AND p.price <= 300000 THEN 0.2
            WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
            ELSE 0.3
    END) AS nett_profit, -- nett_profit: Alias untuk kolom yang menyimpan nilai laba bersih.
    t.rating AS rating_transaksi,  --Memberi label untuk rating transaksi sebagai rating_transaksi.
    i.stock_quantity AS stok_produk  --Mengambil jumlah stok produk yang tersedia dari tabel kf_inventory dan memberi alias stok_produk.

FROM
    `rakaminkfanalyst.kf_final_transaction` t  --FROM: Tabel utama (kf_final_transaction) sebagai sumber utama data transaksi, dengan alias t.
LEFT JOIN
    `rakaminkfanalyst.kf_product` p ON t.product_id = p.product_id  --LEFT JOIN: Menghubungkan tabel transaksi dengan tabel produk untuk mendapatkan detail produk, walaupun ada transaksi tanpa produk terkait.
LEFT JOIN
    `rakaminkfanalyst.kf_kantor_cabang` c ON t.branch_id = c.branch_id  --LEFT JOIN: Menghubungkan tabel transaksi dengan tabel cabang untuk mendapatkan informasi cabang.

LEFT JOIN
    `rakaminkfanalyst.kf_inventory` i ON t.product_id = i.product_id;  --LEFT JOIN: Menghubungkan tabel transaksi dengan tabel inventori untuk mendapatkan informasi stok produk.

