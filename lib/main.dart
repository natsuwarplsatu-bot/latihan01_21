import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;

  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok{
    return _stok;
  }


  bool bisaDijual(int diminta){
    return diminta <= _stok;
  }

  bool jual(int n) {
    if (n <= _stok) {
      _stok -= n;
      return true;
    } else {
      return false;
    }
  }


  double nilaiStok() {
    return harga * _stok;
  }

  void tampilkan() {
    print("========================");
    print("KARTU BARANG");
    print("Nama  : $nama");
    print("Harga : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $_stok");
    print("Nilai Stok : Rp${nilaiStok().toStringAsFixed(0)}");
    print("========================");
  }
}

class BarangPromo extends Barang {
  double persenDiskon;

  BarangPromo(
    String nama,
    double harga,
    int stok,
    this.persenDiskon,
  ) : super(nama, harga, stok);

  double hargaPromo() {
    return harga - (harga * persenDiskon / 100);
  }

  void tampilkanPromo() {
    print("========================");
    print("KARTU BARANG PROMO");
    print("Nama  : $nama");
    print("Harga Normal: Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $_stok");
    print("Diskon : $persenDiskon%)");
    print("Harga Promo : Rp${hargaPromo().toStringAsFixed(0)}");
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

  print("=== STOK AWAL ===");
  barang1.tampilkan();

  print("\n=== PENJUALAN 5 BUKU ===");

  if (barang1.jual(5)) {
    print("Penjualan Berhasil");
  } else {
    print("Penjualan gagal, Stok tidak mencukupi");
  }

  print ("Stok sekarang: ${barang1.stok}");
   
  print("\n=== PENJUALAN 20 BUKU ===");

  if (barang1.jual(20)) {
    print("Penjualan berhasil.");
  } else{
    print("Penjualan gagal, stok tidak mencukupi");
  } 

  print("Stok sekarang: ${barang1.stok}");
}
 /*
Mengapa melindungi _stok penting bagi integritas data koperasi?

Melindungi _stok penting agar jumlah stok tidak dapat diubah
sembarangan dari luar class. Dengan enkapsulasi, stok hanya dapat
berubah melalui method jual() yang mengecek ketersediaan terlebih
dahulu, sehingga data stok tetap akurat dan sesuai dengan transaksi.
*/