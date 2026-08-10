import "package:flutter/material.dart";

class Barang{
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  void tampilkan() {
    print("============================");
    print("KARTU BARANG");
    print("Nama : $nama");
    print("Harga  : Rp${harga.toStringAsFixed(0)}");
    print("Stok : $stok");
    print("============================");
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpem", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

List <Barang> daftarBarang = [
  barang1,
  barang2,
  barang3
];

for (Barang barang in daftarBarang) {
  barang.tampilkan();
}
/*
  Perbandingan dengan Sprint 3:
  Pada Sprint 3, nama dan harga barang disimpan dalam dua List
  yang terpisah, yaitu List<String> namaBarang dan List harga.
  Sekarang data nama, harga, dan stok digabung dalam objek Barang
  dan disimpan dalam satu List<Barang>, sehingga data lebih rapi,
  saling terkait, dan lebih mudah dikelola.
  */
}