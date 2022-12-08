// To parse this JSON data, do
//
//     final allEcomPrakerjaEntity = allEcomPrakerjaEntityFromJson(jsonString);

import 'dart:convert';

List<AllEcomPrakerjaEntity> allEcomPrakerjaEntityFromJson(String str) =>
    List<AllEcomPrakerjaEntity>.from(
        json.decode(str).map((x) => AllEcomPrakerjaEntity.fromJson(x)));

String allEcomPrakerjaEntityToJson(List<AllEcomPrakerjaEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllEcomPrakerjaEntity {
  AllEcomPrakerjaEntity({
    this.id,
    this.title,
    this.slug,
    this.mentor,
    this.linkmarketplace,
    this.price,
    this.sale,
    this.rating,
    this.siswa,
    this.image,
    this.tanggalMulai,
    this.tanggalSelesai,
  });

  int? id;
  String? title;
  String? slug;
  String? mentor;
  Linkmarketplace? linkmarketplace;
  String? price;
  String? sale;
  String? rating;
  String? siswa;
  String? image;
  bool? tanggalMulai;
  bool? tanggalSelesai;

  factory AllEcomPrakerjaEntity.fromJson(Map<String, dynamic> json) =>
      AllEcomPrakerjaEntity(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        mentor: json["mentor"],
        linkmarketplace: Linkmarketplace.fromJson(json["linkmarketplace"]),
        price: json["price"],
        sale: json["sale"],
        rating: json["rating"],
        siswa: json["siswa"],
        image: json["image"],
        tanggalMulai: json["tanggal_mulai"],
        tanggalSelesai: json["tanggal_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "mentor": mentor,
        "linkmarketplace": linkmarketplace!.toJson(),
        "price": price,
        "sale": sale,
        "rating": rating,
        "siswa": siswa,
        "image": image,
        "tanggal_mulai": tanggalMulai,
        "tanggal_selesai": tanggalSelesai,
      };
}

class Linkmarketplace {
  Linkmarketplace({
    this.bukalapakCom,
    this.tokopediaCom,
    this.karierMu,
    this.pintariaCom,
    this.maubelajarapaCom,
    this.pijarmahirId,
  });

  String? bukalapakCom;
  String? tokopediaCom;
  String? karierMu;
  String? pintariaCom;
  String? maubelajarapaCom;
  String? pijarmahirId;

  factory Linkmarketplace.fromJson(Map<String, dynamic> json) =>
      Linkmarketplace(
        bukalapakCom: json["bukalapak.com"],
        tokopediaCom: json["tokopedia.com"],
        karierMu: json["karier.mu"],
        pintariaCom: json["pintaria.com"],
        maubelajarapaCom: json["maubelajarapa.com"],
        pijarmahirId: json["pijarmahir.id"],
      );

  Map<String, dynamic> toJson() => {
        "bukalapak.com": bukalapakCom,
        "tokopedia.com": tokopediaCom,
        "karier.mu": karierMu,
        "pintaria.com": pintariaCom,
        "maubelajarapa.com": maubelajarapaCom,
        "pijarmahir.id": pijarmahirId,
      };
}
