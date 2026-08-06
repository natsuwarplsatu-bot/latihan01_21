void main() {
  int stok = 3;

  print("--- Penjualan Buku Tulis ---");

  // Bahaya jika kondisi while keliru adalah perulangan bisa terus berjalan
  // sehingga stok menjadi minus atau program tidak berhenti (infinite loop).
  // Cara memastikan koperasi tidak menjual melebihi stok adalah dengan
  // menggunakan kondisi while (stok > 0) agar penjualan berhenti saat stok habis.

  while (stok > 0) {
    stok--;
    print("Terjual 1, sisa stok: $stok");
  }
}