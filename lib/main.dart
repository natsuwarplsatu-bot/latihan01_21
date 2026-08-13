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

  @override
  void tampilkanPromo() {
    print("========================");
    print("       PROMO");
    print("KARTU BARANG PROMO");
    print("Nama  : $nama");
    print("Harga Normal: Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $_stok");
    print("Diskon : $persenDiskon%)");
    print("Harga Promo : Rp${hargaPromo().toStringAsFixed(0)}");
    print("========================");
  }
}

class BarangGrosir extends Barang {
  int minimalBeli;

  BarangGrosir(
    String nama, 
    double harga, 
    int stok,
    this.minimalBeli,
  ) : super(nama, harga, stok);

  double hargaGrosir(int jumlah) {
    if (jumlah >= minimalBeli) {
      return harga *0.9;
    }
    return harga;
  }

  @override 
  void tampilkan() {
      print("========================");    
      print("       BARANG GROSIR");
      print("Nama       : $nama");
      print("Harga      : Rp${harga.toStringAsFixed(0)}");
      print("Minimal Beli : $minimalBeli");
      print("Stok       : $stok");
      print("========================");    
  }
}

void main() {
  Barang barang1 = Barang("Buku Tulis", 3000, 20);

  void prosesBeli(String inputJumlah) {
    try {
      int jumlah = int.parse(inputJumlah);

      if (barang1.jual(jumlah)) {
        print("Pembelian berhasil.");
        print("Jumlah dibeli: $jumlah");
        print("Sisa stok: ${barang1.stok}");
      } else {
        print("Stok tidak mencukupi.");
      }
    } catch (e) {
      print("Input tidak valid. silahkan masukkan angka.");
    } finally {
      print("Transaksi dicatat di log.");
    }
  }
  BarangPromo barangPromo = BarangPromo(
    "Pensil",
    2000,
    30,
    10,
  );

  BarangGrosir barangGrosir = BarangGrosir(
    "Pulpen",
    2500,
    100,
    10,
  );

  print("=== BARANG BIASA ===");
  barang1.tampilkan();

  print("\n=== BARANG PROMO ===");
  barangPromo.tampilkan();

  print("\n=== BARANG GROSIR ===");
  barangGrosir.tampilkan();

  print(
    "Harga grosir 10 pulpen: "
    "Rp${barangGrosir.hargaGrosir(10).toStringAsFixed(0)}",
  );
 // Uji serangan:
// barang1._stok = 100;
// _stok tidak seharusnya diubah langsung.
// Perubahan stok dilakukan melalui method jual().
  print("\n=== UJI STOK ===");
  print("Stok sebelum dijual: ${barang1.stok}");

  barang1.jual(5);

  print("Stok setelah dijual 5: ${barang1.stok}");

  print("\n=== PROSES PEMBELIAN ===");
  prosesBeli("2");
  prosesBeli("dua");
}
  // Penanganan error meningkatkan kepercayaan pengurus karena
  // program tidak langsung berhenti saat terjadi kesalahan input.
  // Program memberikan pesan yang jelas kepada petugas dan tetap
  // berjalan sehingga transaksi lebih aman dan tidak mudah gagal.