import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  double nilaiStok() {
    return harga * stok;
  }

  void tampilkan() {
    print("========================");
    print("KARTU BARANG");
    print("Nama  : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $stok");
    print("Nilai Stok : Rp${nilaiStok().toStringAsFixed(0)}");
    print("========================");
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15);
  Barang barang3 = Barang("Roti", 5000, 10);

  barang1.tampilkan(); 
  barang2.tampilkan();
  barang3.tampilkan();
}