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
