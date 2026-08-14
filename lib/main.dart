import "package:flutter/material.dart";

class Barang {
  String nama;
  double harga;

  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok {
    return _stok;
  }

  bool bisaDijual(int diminta) {
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
  void tampilkan() {
    print("========================");
    print("       PROMO");
    print("KARTU BARANG PROMO");
    print("Nama  : $nama");
    print("Harga Normal : Rp${harga.toStringAsFixed(0)}");
    print("Stok  : $stok");
    print("Diskon : $persenDiskon%");
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
      return harga * 0.9;
    }

    return harga;
  }

  @override
  void tampilkan() {
    print("========================");
    print("       BARANG GROSIR");
    print("Nama         : $nama");
    print("Harga        : Rp${harga.toStringAsFixed(0)}");
    print("Minimal Beli : $minimalBeli");
    print("Stok         : $stok");
    print("========================");
  }
}

Future<void> muatLaporan() async {
  print("Menyiapkan laporan...");
  await Future.delayed(Duration(seconds: 1));
  print("Laporan siap!");
}

double hitungPotongan(double total) {
  if (total > 200000) {
    return 10;
  } else if (total > 100000) {
    return 5;
  }

  return 0;
}

double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

void prosesBeli(
  Barang barang,
  String inputJumlah,
  bool anggota,
) {
  try {
    int jumlah = int.parse(inputJumlah);

    if (jumlah <= 0) {
      print("Jumlah pembelian harus lebih dari 0.");
      return;
    }

    if (!barang.bisaDijual(jumlah)) {
      print("Stok tidak mencukupi.");
      return;
    }

    double harga = barang.harga;

    if (anggota) {
      harga = harga * 0.95;
    }

    double total = harga * jumlah;
    double persenPotongan = hitungPotongan(total);
    double hargaAkhir = hitungHargaAkhir(
      total,
      persenPotongan,
    );

    if (barang.jual(jumlah)) {
      print("Pembelian berhasil.");
      print("Nama barang    : ${barang.nama}");
      print("Status pembeli : ${anggota ? "Anggota" : "Umum"}");
      print("Jumlah dibeli  : $jumlah");
      print("Harga satuan   : Rp${harga.toStringAsFixed(0)}");
      print("Total          : Rp${total.toStringAsFixed(0)}");
      print("Potongan       : $persenPotongan%");
      print("Harga akhir    : Rp${hargaAkhir.toStringAsFixed(0)}");
      print("Sisa stok      : ${barang.stok}");
    }
  } catch (e) {
    print(
      "Input '$inputJumlah' bukan angka. "
      "Silakan masukkan jumlah dalam angka.",
    );
  } finally {
    print("Transaksi dicatat di log.");
  }
}

Future<void> main() async {
  Barang barang1 = Barang(
    "Buku Tulis",
    3000,
    20,
  );

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

  print("=== LAPORAN KOPERASI ===");
  await muatLaporan();

  print("\n=== BARANG BIASA ===");
  barang1.tampilkan();

  print("\n=== BARANG PROMO ===");
  barangPromo.tampilkan();

  print("\n=== BARANG GROSIR ===");
  barangGrosir.tampilkan();

  print(
    "Harga grosir 10 pulpen: "
    "Rp${barangGrosir.hargaGrosir(10).toStringAsFixed(0)}",
  );

  print("\n=== UJI STOK ===");
  print("Stok sebelum dijual: ${barang1.stok}");

  barang1.jual(5);

  print("Stok setelah dijual 5: ${barang1.stok}");

  print("\n=== PROSES PEMBELIAN ===");

  prosesBeli(
    barang1,
    "2",
    true,
  );

  prosesBeli(
    barang1,
    "dua",
    true,
  );
}