import 'dart:convert';

List<HomeOneEcomEntity> homeOneEcomFromJson(String str) =>
    List<HomeOneEcomEntity>.from(
        json.decode(str).map((x) => HomeOneEcomEntity.fromJson(x)));

String homeOneEcomToJson(List<HomeOneEcomEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeOneEcomEntity {
  HomeOneEcomEntity({
    this.id,
    this.title,
    this.permalink,
    this.mentor,
    this.linkmarketplace,
    this.price,
    this.rating,
    this.siswa,
    this.image,
    this.sale,
    this.tanggalMulai,
    this.tanggalSelesai,
  });

  int? id;
  String? title;
  String? permalink;
  String? mentor;
  String? linkmarketplace;
  String? price;
  String? rating;
  String? siswa;
  String? image;
  String? sale;
  int? tanggalMulai;
  int? tanggalSelesai;

  factory HomeOneEcomEntity.fromJson(Map<String, dynamic> json) =>
      HomeOneEcomEntity(
        id: json["id"],
        title: json["title"],
        permalink: json["permalink"],
        mentor: json["mentor"],
        linkmarketplace: json["linkmarketplace"],
        price: json["price"],
        rating: json["rating"],
        siswa: json["siswa"],
        image: json["image"],
        sale: json["sale"] == null || json["sale"] == false ? "" : json["sale"],
        tanggalMulai:
            json["tanggal_mulai"] == null || json["tanggal_mulai"] == false
                ? 0
                : json["tanggal_mulai"],
        tanggalSelesai:
            json["tanggal_selesai"] == null || json["tanggal_selesai"] == false
                ? 0
                : json["tanggal_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "permalink": permalink,
        "mentor": mentor,
        "linkmarketplace": linkmarketplace,
        "price": price,
        "rating": rating,
        "siswa": siswa,
        "image": image,
      };
}
