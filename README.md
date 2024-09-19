# 📝 **Spesifikasi Kebutuhan Perangkat Lunak (SRS) untuk PajakPro**

## 📖 1. Pendahuluan

### 1.1 **Tujuan**
Dokumen ini menjelaskan Spesifikasi Kebutuhan Perangkat Lunak (SRS) untuk **PajakPro**, aplikasi perhitungan pajak mobile yang dirancang untuk membantu individu dan usaha kecil menghitung pajak mereka secara akurat, melacak riwayat, dan menghasilkan laporan pajak.

### 1.2 **Ruang Lingkup**
**PajakPro** adalah aplikasi mobile lintas platform yang dibangun menggunakan Flutter dan Firebase. Aplikasi ini menyediakan fungsi untuk menghitung pajak berdasarkan pendapatan, menerapkan pengurangan pajak, mensimulasikan skenario pajak, menyimpan riwayat pajak, dan menghasilkan laporan. Aplikasi ini akan digunakan oleh individu, freelancer, dan pemilik usaha kecil.

### 1.3 **Definisi, Akronim, dan Singkatan**
- **SRS**: Spesifikasi Kebutuhan Perangkat Lunak
- **Flutter**: Toolkit UI untuk membangun aplikasi yang dikompilasi secara native untuk mobile, web, dan desktop
- **Firebase**: Platform yang dikembangkan oleh Google untuk membuat aplikasi mobile dan web
- **Firestore**: Database cloud NoSQL dari Firebase

### 1.4 **Referensi**
- [📄 Dokumentasi Firebase](https://firebase.google.com/docs)
- [📘 Dokumentasi Flutter](https://flutter.dev/docs)
- [📝 Pajak Indonesia](https://pajak.go.id)

---

## 🚀 2. Deskripsi Umum

### 2.1 **Fitur Produk**
- 🔐 **Autentikasi Pengguna**: Daftar dan masuk melalui Google atau email.
- 📊 **Perhitungan Pajak**: Menghitung pajak berdasarkan pendapatan, jenis pekerjaan, dan faktor lainnya.
- 📑 **Laporan Tahunan**: Menghasilkan laporan PDF untuk pelaporan pajak tahunan.
- 💾 **Manajemen Riwayat**: Melihat dan menyimpan perhitungan pajak sebelumnya.
- 💡 **Simulasi**: Melakukan simulasi pajak untuk melihat bagaimana perubahan pendapatan memengaruhi kewajiban pajak.
- 🔔 **Notifikasi Pengingat**: Mengingatkan pengguna tentang tenggat waktu pajak yang akan datang.

### 2.2 **Karakteristik Pengguna**
- **Individu**: Karyawan yang perlu menghitung pajak pribadi.
- **Freelancer & Pengusaha**: Pekerja independen atau pemilik usaha kecil yang menghitung pajak untuk pendapatan mereka sendiri.

### 2.3 **Batasan**
- Aplikasi ini hanya untuk panduan dan tidak memberikan nasihat pajak resmi.
- Pengguna bertanggung jawab untuk memastikan bahwa data pendapatan yang dimasukkan akurat.

---

## 🔧 3. Kebutuhan Fungsional

### 3.1 **Autentikasi**
- **Deskripsi**: Pengguna dapat mendaftar dan masuk menggunakan Firebase Authentication.
- **Input**: Kredensial login email/Google.
- **Output**: Token autentikasi untuk akses pengguna yang aman.

### 3.2 **Perhitungan Pajak**
- **Deskripsi**: Menghitung pajak berdasarkan pendapatan dan jenis pekerjaan.
- **Input**: Pendapatan, kategori pekerjaan, dan pengurangan pajak.
- **Output**: Total pajak yang harus dibayar dan rincian perhitungan.
- **Formula**:
  - Tarif pajak karyawan: 5% dari pendapatan tahunan setelah pengurangan.
  - Tarif pajak freelancer: 10% dari pendapatan tahunan setelah pengurangan.

### 3.3 **Pengurangan Pajak**
- **Deskripsi**: Menerapkan pengurangan seperti donasi, biaya pendidikan, dan asuransi.
- **Input**: Jumlah pengurangan.
- **Output**: Pendapatan yang dapat dikenakan pajak berkurang dan total pajak yang diperbarui.

### 3.4 **Laporan Pajak Tahunan**
- **Deskripsi**: Menghasilkan laporan yang dapat diunduh dalam format PDF.
- **Input**: Tahun laporan yang diinginkan.
- **Output**: Laporan pajak dalam format PDF dengan semua perhitungan.

### 3.5 **Manajemen Riwayat**
- **Deskripsi**: Menyimpan dan mengambil perhitungan pajak sebelumnya.
- **Output**: Tabel perhitungan pajak sebelumnya, diurutkan berdasarkan tanggal.

### 3.6 **Notifikasi**
- **Deskripsi**: Pengguna menerima pengingat untuk tenggat waktu pajak yang penting.
- **Output**: Notifikasi push untuk tanggal jatuh tempo pembayaran pajak.

---

## 🛠 4. Kebutuhan Non-Fungsional

### 4.1 **Performa**
- **Responsivitas**: Perhitungan harus selesai dalam waktu kurang dari 2 detik.
- **Skalabilitas**: Sistem harus mendukung hingga 1.000.000 pengguna secara bersamaan.

### 4.2 **Keamanan**
- **Enkripsi Data**: Semua data pengguna, termasuk pendapatan dan perhitungan, harus dienkripsi menggunakan Firestore.
- **Autentikasi**: Login aman melalui Firebase Authentication.

### 4.3 **Reliabilitas**
- **Uptime**: Diharapkan 99.9% uptime untuk memastikan pengguna dapat mengakses layanan setiap saat.
- **Penanganan Kesalahan**: Jika terjadi kesalahan jaringan, aplikasi harus memberi tahu pengguna dan menyediakan opsi untuk mencoba lagi.

### 4.4 **Portabilitas**
- **Dukungan Lintas Platform**: Aplikasi harus berfungsi pada Android (versi minimal 7.0) dan iOS (versi minimal 12).

### 4.5 **Skalabilitas**
- Aplikasi harus skalabel dengan efisien untuk mendukung peningkatan jumlah pengguna tanpa menurunkan performa.

### 4.6 **Antarmuka Pengguna**
- Antarmuka harus mengikuti pedoman Material Design, memastikan pengalaman pengguna yang bersih, modern, dan intuitif.

---

## 📱 5. Desain Antarmuka Pengguna

### 5.1 **Layar Login**
- 🔑 Pengguna dapat masuk menggunakan Google.

### 5.2 **Layar Beranda**
- 🏠 Menampilkan opsi untuk melakukan perhitungan pajak, melihat riwayat, dan menghasilkan laporan.

### 5.3 **Layar Perhitungan Pajak**
- 🧮 Kolom input untuk pendapatan, jenis pekerjaan, dan pengurangan.
- 🧾 Menampilkan total pajak yang dihitung secara real-time setelah input.

### 5.4 **Layar Laporan**
- 📑 Pengguna dapat menghasilkan dan mengunduh laporan pajak tahunan.

### 5.5 **Layar Riwayat**
- 📜 Daftar perhitungan pajak sebelumnya dengan opsi untuk melihat detail atau menghapus entri.

---

## 🔗 6. Arsitektur Sistem

### 6.1 **Backend**
- **Firebase Firestore**: Database NoSQL untuk menyimpan data pengguna dan catatan pajak.
- **Firebase Authentication**: Menyediakan login dan autentikasi yang aman.
- **Cloud Functions**: (Opsional) Untuk tugas backend kompleks seperti penanganan laporan pajak besar.

### 6.2 **Frontend**
- **Flutter**: Digunakan untuk membangun aplikasi mobile untuk Android dan iOS.
- **Integrasi API**: Mengintegrasikan dengan Firebase untuk manajemen data dan autentikasi.

---

## 🧪 7. Pengujian

### 7.1 **Pengujian Unit**
- Menguji setiap fungsi, seperti perhitungan pajak dan pengurangan, untuk memastikan keakuratan.

### 7.2 **Pengujian Integrasi**
- Memastikan bahwa integrasi Firebase Authentication dan Firestore berjalan lancar di berbagai perangkat.

### 7.3 **Pengujian Penerimaan Pengguna (UAT)**
- Mengumpulkan umpan balik dari sekelompok pengguna kecil untuk memastikan aplikasi memenuhi kebutuhan dunia nyata.

### 7.4 **Pengujian Performa**
- Menguji performa aplikasi di berbagai kondisi, termasuk kecepatan internet rendah dan beban pengguna berat.

---

## 📆 8. Rencana Proyek

### 8.1 **Tonggak Sejarah**
- **Minggu 1**: Pengaturan proyek dan integrasi autentikasi.
- **Minggu 2**: Implementasi logika perhitungan pajak.
- **Minggu 3**: Menambahkan fitur laporan dan riwayat.
- **Minggu 4**: Pengujian akhir dan perbaikan bug.

---

## 🏅 9. Kesimpulan
**PajakPro** bertujuan untuk menyederhanakan perhitungan pajak bagi individu dan pemilik usaha kecil, memberikan solusi yang efisien dan mudah digunakan. Dengan keamanan dan performa yang kuat, **PajakPro** adalah alat yang solid untuk mengelola pajak pribadi dan usaha.

---

© 2024 Tim PajakPro
