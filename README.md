# Laporan Praktikum 7  
**Pemrograman Mobile - Plugin Flutter (OCR Sederhana)**  

---

## Identitas  
- **Nama**       : Randa Heru Kusuma  
- **NIM**        : 2341760009  
- **Praktikum**  : 7 - Optical Character Recognition (OCR)  

---

## Hasil  
Berikut adalah tampilan hasil praktikum 7:

Gambar 1. Tampilan halaman utama aplikasi OCR Sederhana.
![Hasil Akhir](assets/hasilakhir1.png)
Gambar 2. Tampilan aplikasi saat dijalankan di emulator atau perangkat HP.
![Hasil  Emulator HP](assets/hasilakhir2.jpg)
Gambar 3. Proses pengambilan gambar dan hasil deteksi teks menggunakan fitur OCR.
![Hasil Camera OCR](assets/hasilakhir3.jpg)

---

## Deskripsi Praktikum  
Pada praktikum ini dipelajari cara membuat aplikasi **OCR (Optical Character Recognition)** sederhana menggunakan **Flutter**.  
Aplikasi ini berfungsi untuk mengambil gambar menggunakan kamera dan mengenali teks di dalam gambar menggunakan plugin **Google ML Kit Text Recognition**.  

Langkah-langkah yang dilakukan antara lain:  
1. Membuat proyek Flutter baru bernama `ocr_sederhana`.  
2. Menambahkan plugin **kamera** dan **ML Kit Text Recognition** ke dalam file `pubspec.yaml`.  
3. Menambahkan izin kamera dan penyimpanan pada file `AndroidManifest.xml`.  
4. Membuat struktur folder dan file utama seperti `main.dart`, `splash_screen.dart`, `home_screen.dart`, `scan_screen.dart`, dan `result_screen.dart`.  
5. Menjalankan aplikasi di emulator atau perangkat nyata untuk mengambil gambar dan mendeteksi teks.  

---

## Tugas Praktikum  
1. Jalankan aplikasi di emulator atau HP.  
2. Lakukan scan terhadap teks cetak (misalnya: buku, koran, atau layar HP).  
3. Amati hasil OCR yang muncul.  
   > Teks yang terdeteksi oleh sistem sesuai dengan tulisan pada gambar.  
   > Jika belum akurat, coba ambil ulang foto dengan pencahayaan yang lebih baik atau posisi teks lebih tegak dan jelas.  

---

### a. Apakah semua teks terbaca dengan akurat? Mengapa?  
Tidak semua teks selalu terbaca dengan akurat, karena hasil OCR dipengaruhi oleh kualitas gambar, pencahayaan, jenis font, dan ketegasan huruf.  

---

### b. Apa kegunaan fitur OCR dalam kehidupan sehari-hari?  
1. Memindai dokumen kertas menjadi file teks.  
2. Membaca tulisan dari foto atau nota belanja.  
3. Mengambil teks dari papan, buku, atau kartu nama.  
4. Membantu aksesibilitas bagi penyandang tunanetra dengan pembaca teks otomatis.  

---

### c. Sebutkan 2 contoh aplikasi nyata yang menggunakan OCR!  
1. **Google Lens** – mengenali dan menyalin teks dari gambar secara langsung.  
2. **CamScanner** – memindai dokumen kertas menjadi teks digital dan file PDF yang dapat diedit.  

---

## Kesimpulan  
Dari praktikum ini dapat disimpulkan bahwa teknologi **OCR** memungkinkan sistem untuk mengenali teks dari gambar dengan memanfaatkan pembelajaran mesin.  
Fitur ini sangat bermanfaat dalam digitalisasi dokumen, efisiensi kerja, dan peningkatan aksesibilitas bagi pengguna.
