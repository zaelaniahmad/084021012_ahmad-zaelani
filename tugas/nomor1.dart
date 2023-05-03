void main() {
  PersegiPanjang kotak; //inisialisasi nama objectnya
  double luaskotak; //inisialisasi tipe data

  kotak = new PersegiPanjang(); //inisialisasi/buat alias nama
  kotak.panjang = 2; //menambahkan value panjang
  kotak.lebar = 3; //menambahkan value lebar
  luaskotak = kotak.hitungluas();
  //membuat inisialisasi hitung luas
  //diambil dari object kotak yang di panggil dari class

  print(luaskotak);
}

class PersegiPanjang {
  late double panjang; //inisialisasi tipe data panjang
  late double lebar; //inisalisasi tipe data lebar
  double hitungluas() {
    return this.panjang * lebar; //menghitung luas
  }
}
