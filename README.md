<h1>
Tutorial 3 - Introduction to Game Programming with GDScript for Implementing Basic 2D Game Mechanics
</h1>

---

Nama: Samuel Taniel Mulyadi<p></p>
NPM: 2206081805

<h2>Pendahuluan</h2>

---

Tutorial ini bertujuan untuk mengembangkan mekanika pergerakan karakter dalam game platformer 2D menggunakan Godot Engine. Fitur-fitur yang diimplementasikan meliputi:

- **Double Jump** - Karakter dapat melompat dua kali.
- **Dashing** - Karakter dapat melakukan dash ke kiri atau kanan.
- **Crouching** - Karakter dapat jongkok dengan perubahan skala sprite dan parameter gerakan.
- **Attack/Interact** - Karakter dapat menyerang dengan animasi khusus.
- **Sliding** - Karakter dapat melakukan slide dalam posisi jongkok.

<p></p>
<h2>Implementasi</h2>

---

Kode diimplementasikan dalam Godot menggunakan bahasa pemrograman GDScript dengan CharacterBody2D sebagai basis karakter.

1. **Double Jump**

    Double jump memungkinkan karakter melompat dua kali berturut-turut sebelum menyentuh tanah.

    Jika karakter berada di lantai (is_on_floor()), jumlah lompatan (jump_count) di-reset ke 0.

    Jika tombol lompat ditekan (ui_up), karakter melompat dan jump_count bertambah.

    Jika jump_count == 1, karakter bisa melakukan lompatan kedua.

2. **Dashing**

    Dash memungkinkan karakter bergerak cepat dalam waktu singkat.

    Pemain harus menekan tombol arah dua kali dalam rentang waktu tertentu (dash_time_window).

    Jika input arah ditekan dua kali, karakter mulai dash dalam arah yang ditekan.

    Dash memiliki timer (dash_timer) untuk membatasi durasinya.

3. **Crouching**

    Karakter dapat berjongkok untuk menghindari rintangan dengan perubahan skala sprite.

    Jika tombol ui_down ditekan, karakter berubah skala dan posisinya disesuaikan.

    Kecepatan berjalan, kecepatan lompatan, dan gravitasi dikurangi saat jongkok.

    Jika tombol dilepas, karakter kembali ke keadaan normal.

4. **Attack/Interact**

    Karakter dapat menyerang dengan animasi khusus.

    Jika pemain menekan tombol serang (left_click), animasi serangan dimainkan.

    Attack memiliki cooldown (attack_cooldown) untuk mencegah spam.

    Setelah animasi selesai, status menyerang direset.

5. **Sliding**

    Sliding memungkinkan karakter meluncur di tanah.

    Jika karakter di lantai dan shift ditekan bersama tombol arah, slide dimulai.

    Karakter bergerak cepat ke arah yang ditekan untuk waktu tertentu (slide_duration).

    Setelah durasi habis, karakter berhenti.

<h2>Kesimpulan</h2>

Fitur-fitur ini meningkatkan pengalaman bermain dengan memberikan kontrol karakter yang lebih responsif. Implementasi dapat dikembangkan lebih lanjut dengan menambahkan efek visual atau suara untuk meningkatkan feedback kepada pemain.

<h2>Referensi</h2>

---

- Dokumentasi resmi Godot: https://docs.godotengine.org/

---

<h1>Tutorial 5 - Assets Creation & Integration</h1>

---

<h2>Latihan Mandiri: Membuat dan Menambah Variasi Aset</h2>

---

<p>Dalam latihan ini, saya telah mengimplementasikan berbagai fitur baru ke dalam permainan:</p>

```md
1. Penggantian Sprite2D Player dengan Sprite Baru
   - Saya mengganti sprite karakter utama dengan sprite baru dan menambahkan animasi yang sesuai menggunakan spritesheet.

2. Pembuatan Objek Bola dengan AnimatedSprite
   - Saya membuat objek bola yang memiliki AnimatedSprite, sehingga bisa memiliki animasi tersendiri.

3. Penambahan Audio Dinamis
   - Saya menambahkan musik latar yang berubah volume tergantung jarak pemain dari area tertentu.
   - Jika pemain semakin jauh dari posisi awal level, musik lain akan terdengar lebih jelas dan musik sebelumnya semakin samar.

4. Penambahan Efek Suara
   - Efek suara ditambahkan untuk berbagai aksi karakter seperti dash, lompat, dan serangan.

5. Interaksi antara Objek Bola dan Player
   - Saat player menabrak bola, bola akan tersundul atau tertendang berdasarkan arah tabrakan.

6. Audio Feedback dari Interaksi Bola dan Player
   - Saat bola ditabrak oleh pemain, efek suara khusus akan dimainkan untuk memberikan feedback audio kepada pemain.
```

<h2>Ide Tambahan yang Dikembangkan</h2>

---

- Sistem audio berbasis posisi objek (misalnya, efek suara terdengar lebih kuat jika objek mendekati pemain).
- Efek visual tambahan untuk memperjelas aksi pemain dan objek di dalam game.
- Penyesuaian parameter fisika bola agar lebih realistis dalam interaksi dengan dunia game.


<h2>Kesimpulan</h2>

---

<p> Dengan menambahkan variasi aset seperti animasi, efek suara, dan interaksi objek, pengalaman bermain menjadi lebih dinamis dan menarik. Integrasi elemen-elemen ini memberikan feedback yang lebih baik bagi pemain dan meningkatkan imersi dalam permainan. </p>

---
