import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  double nilaiStok() {
    return harga * stok;
  }

  bool bisaDijual(int diminta){
    return diminta <= stok;
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

class Pembeli {
  String nama;
  bool statusAnggota;

  Pembeli(this.nama, this.statusAnggota);
  void tampilkan() {
    print("Nama Pembeli : $nama");
    print("Status Anggota : ${statusAnggota ? "Anggota" : "Umum"}");
  }
}


void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);
  Barang barang2 = Barang("Pulpen", 2500, 15); 
  Barang barang3 = Barang("Roti", 5000, 10);

  Pembeli pembeli1 = Pembeli("Budi", true);
  print("=== Data Pembeli ===");
  pembeli1.tampilkan();


  print("\n === Data Barang ===");
  barang1.tampilkan(); 
  barang2.tampilkan();
  barang3.tampilkan();

  /*
  Relasi Pembeli dan Barang dalam satu transaksi adalah asosiasi.
  Satu Pembeli dapat membeli satu atau beberapa Barang.
  Barang tidak dimiliki oleh Pembeli karena barang tetap menjadi
  data koperasi dan hanya digunakan dalam transaksi.
  */
}