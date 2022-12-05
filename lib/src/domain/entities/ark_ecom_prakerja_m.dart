import 'dart:convert';

List<HomeOneEcom> homeOneEcomFromJson(String str) => List<HomeOneEcom>.from(
    json.decode(str).map((x) => HomeOneEcom.fromJson(x)));

String homeOneEcomToJson(List<HomeOneEcom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeOneEcom {
  HomeOneEcom({
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

  factory HomeOneEcom.fromJson(Map<String, dynamic> json) => HomeOneEcom(
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
