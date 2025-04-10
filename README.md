# 🌟 Leip Bot - Waitlist Automator

Leip Bot adalah alat otomatisasi untuk mendaftar ke waitlist Leippass secara massal. Script ini dibuat menggunakan Ruby dan dirancang untuk membantu pengguna mengirimkan pendaftaran waitlist dengan email dan username acak, lengkap dengan kode referal. Fitur utama termasuk tampilan tabel hasil, progress bar, dan penanganan error untuk pengalaman yang mulus.

## 📋 Fitur
- **Otomatisasi Pendaftaran**: Kirim beberapa request pendaftaran waitlist dengan sekali jalan.
- **Generator Acak**: Buat username dan email sementara secara otomatis.
- **Tampilan Keren**: Hasil ditampilkan dalam tabel dengan warna menggunakan `terminal-table` dan `colorize`.
- **Progress Bar**: Lacak proses pendaftaran dengan `ruby-progressbar`.
- **Delay Acak**: Tambahkan jeda 10-15 detik antar request untuk menghindari rate limit.
- **Error Handling**: Tangani error seperti input salah atau kegagalan koneksi ke API.

## 🛠 Prasyarat
Sebelum menjalankan script, pastikan kamu sudah menginstall:
- **Ruby** (versi 3.0 atau lebih baru direkomendasikan). Cek dengan `ruby -v`.
- **Gem Dependencies** (library Ruby yang diperlukan).

## 📦 Instalasi
Ikuti langkah-langkah berikut untuk menyiapkan dan menjalankan script:

1. **Clone Repository**
   ```bash
   git clone https://github.com/<Yuurichan-N3/LeipPass-bot.git
   cd LeipPass-bot
   ```

2. **Install Ruby Gems**
   Script ini membutuhkan beberapa gem. Install dengan perintah berikut:
   ```bash
   gem install httparty json colorize terminal-table ruby-progressbar
   ```
   Atau, jika menggunakan Bundler:
   - Buat file `Gemfile` dengan isi:
     ```ruby
     source 'https://rubygems.org'
     gem 'httparty'
     gem 'json'
     gem 'colorize'
     gem 'terminal-table'
     gem 'ruby-progressbar'
     ```
   - Jalankan:
     ```bash
     bundle install
     ```

3. **Siapkan Script**
   Pastikan file `bot.rb` ada di direktori proyek.

## 🚀 Cara Penggunaan
1. **Jalankan Script**
   ```bash
   ruby bot.rb
   ```

2. **Ikuti Prompt**
   - Masukkan jumlah request (misalnya: `5` untuk 5 pendaftaran).
   - Masukkan kode referal (contoh: `Yuurichan`).
   - Script akan:
     - Membuat username dan email acak untuk setiap request.
     - Mengirim data ke API Leippass.
     - Menampilkan hasil dalam tabel (username, email, kode referal, status).
     - Menunjukkan progress bar selama proses.

3. **Contoh Output**
   ```
   ╔══════════════════════════════════════════════╗
   ║       🌟 LEIP BOT - Waitlist Automator       ║
   ║   Automate your Leippass waitlist signup!    ║
   ║  Developed by: https://t.me/sentineldiscus   ║
   ╚══════════════════════════════════════════════╝

   Memulai proses pendaftaran waitlist
   Masukkan jumlah request yang ingin dilakukan: 1
   Masukkan kode referal (contoh: Yuurichan): yuurichan
   Mengirim permintaan ke-1
   Berhasil gabung waitlist untuk request ke-1
   +-------------------+------------------+
   | Hasil Pendaftaran Waitlist #1        |
   +-------------------+------------------+
   | Parameter         | Nilai            |
   +-------------------+------------------+
   | Nama Pengguna     | abcdefgh         |
   | Email             | ijklmnopqr.guerilla@gmail.com |
   | Kode Referal      | yuurichan        |
   | Status Register   | Sukses           |
   +-------------------+------------------+
   ```

## ⚙ Konfigurasi Tambahan (Opsional)
- **Ubah Delay**: Jika server Leippass ketat dengan rate limit, edit bagian `rand(10.0..15.0)` di script untuk menambah delay (misalnya `rand(15.0..20.0)`).
- **Custom Email**: Ubah format email di fungsi `generate_temp_email` jika perlu domain lain.
- **Header HTTP**: Header di script sudah meniru browser Android Chrome. Jika perlu tweak, edit bagian `headers` di script.

## 🐛 Troubleshooting
- **Error: `undefined method 'to_json'`**  
  Pastikan gem `json` sudah terinstall (`gem install json`).
- **Error: `cannot load such file`**  
  Install gem yang hilang sesuai pesan error (contoh: `gem install httparty`).
- **Gagal Koneksi API**  
  Cek koneksi internet atau pastikan URL API (`https://www.leippass.xyz/api/waitlist`) masih valid.
- **Status Gagal (bukan 200)**  
  Server mungkin nolak request. Coba tambah delay atau cek apakah email acak diterima server.

## 📜 Lisensi
Script ini didistribusikan untuk keperluan pembelajaran dan pengujian. Penggunaan di luar tanggung jawab pengembang.

Untuk update terbaru, bergabunglah di grup **Telegram**: [Klik di sini](https://t.me/sentineldiscus).

---

## 💡 Disclaimer
Penggunaan bot ini sepenuhnya tanggung jawab pengguna. Kami tidak bertanggung jawab atas penyalahgunaan skrip ini.
