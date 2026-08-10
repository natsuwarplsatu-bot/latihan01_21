import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int stok;

  // Konstruktor
  Barang(this.nama, this.harga, this.stok);

  // Method untuk menampilkan kartu barang
  void tampilkan() {
    print("========================");
    print("KARTU BARANG");
    print("Nama  : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $stok");
    print("========================");
  }
}

void main() {
  // Membuat 3 objek Barang
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

  // Menyimpan semua objek Barang ke dalam List
  List<Barang> daftarBarang = [
    barang1,
    barang2,
    barang3,
  ];

  print("=== DAFTAR BARANG KOPERASI ===");

  // Menampilkan seluruh barang menggunakan perulangan
  for (int i = 0; i < daftarBarang.length; i++) {
    print(
      "${i + 1}. ${daftarBarang[i].nama} - "
      "Rp${daftarBarang[i].harga.toStringAsFixed(0)} "
      "- Stok: ${daftarBarang[i].stok}",
    );
  }

  print("");
  print("=== KARTU BARANG ===");

  // Memanggil method tampilkan() setiap objek
  for (Barang barang in daftarBarang) {
    barang.tampilkan();
  }

  /*
  Perbandingan dengan Sprint 3:
  Pada Sprint 3, nama dan harga barang disimpan dalam dua List
  yang terpisah, yaitu List<String> namaBarang dan List harga.
  Sekarang nama, harga, dan stok digabung dalam objek Barang
  dan disimpan dalam satu List<Barang>. Cara ini lebih rapi,
  data setiap barang tetap saling terkait, dan lebih mudah
  dikelola ketika jumlah barang bertambah.
  */
}