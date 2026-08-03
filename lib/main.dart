import 'package:flutter/material.dart';

void main() {
  String namaBarang = "Buku Tulis";
  int hargaAnggota = 3000;
  int hargaUmum = 3500;
  int jumlahStok = 40;
  bool tersedia = true;

  //PEMBELIAN
  int jumlahBeli = 3;

  //PERHITUNGAN
  int totalAnggota = jumlahBeli * hargaAnggota;
  int totalUmum = jumlahBeli * hargaUmum;
  int selisih = totalUmum - totalAnggota;

  print("=== KARTU DATA BARANG ===");
  print("Nama Barang: $namaBarang");
  print("Harga Anggota  : Rp $hargaAnggota");
  print ("Harga Umum     : Rp $hargaUmum");
  print("Jumlah Stok    : $jumlahStok");
  print ("Tersedia       : $tersedia");
  print("Total (anggota)  : $jumlahBeli pcs: Rp$totalAnggota");
  print("Selisih vs umum : RP$selisih");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Data Barang')),
      body: const Center(
        child: Text("hasil print di Debug Console")
        ),
      ),
    );
  }
}
// Pemilihan tipe data yang tepat membuat perhitungan kasir menjadi akurat.
// Harga dan stok menggunakan tipe data angka agar dapat dihitung dengan benar,
// sedangkan status tersedia menggunakan boolean karena hanya memiliki dua kondisi: true atau false.