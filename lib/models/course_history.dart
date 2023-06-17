class CourseHistory {
  final int? id;
  final String? title;
  final String? order;
  final String? img;
  final String? kursus;
  final String? kategori;
  final String? nama;
  final String? telepon;
  final String? email;
  final String? negara;
  final String? harga;
  final String? pembayaran;
  final String? tanggal;
  final String? idTransaksi;
  final String? status;

  CourseHistory({
    this.id,
    this.title,
    this.order,
    this.img,
    this.kursus,
    this.kategori,
    this.nama,
    this.telepon,
    this.email,
    this.negara,
    this.harga,
    this.pembayaran,
    this.tanggal,
    this.idTransaksi,
    this.status,
  });

  factory CourseHistory.fromJson(Map<String, dynamic> json) {
    return CourseHistory(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      img: json['img'],
      kursus: json['kursus'],
      kategori: json['kategori'],
      nama: json['nama'],
      telepon: json['telephone'],
      email: json['email'],
      harga: json['harga'],
      pembayaran: json['pembayaran'],
      tanggal: json['tanggal'],
      idTransaksi: json['idTransaksi'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tilte': title,
        'order': order,
        'img': img,
        'kursus': kursus,
        'kategori': kategori,
        'nama': nama,
        'telephone': telepon,
        'email': email,
        'harga': harga,
        'pembayaran': pembayaran,
        'tanggal': tanggal,
        'idTransaksi': idTransaksi,
        'status': status,
      };
}
