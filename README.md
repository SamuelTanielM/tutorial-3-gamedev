<h1>
README: Implementasi Mekanika Pergerakan Karakter di Game Platformer
</h1>

---

Nama: Samuel Taniel Mulyadi
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

