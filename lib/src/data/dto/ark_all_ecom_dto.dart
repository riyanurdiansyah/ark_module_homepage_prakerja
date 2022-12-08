import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';

class AllEcomPrakerjaDto extends AllEcomPrakerjaEntity {
  AllEcomPrakerjaDto({
    required super.id,
    required super.title,
    required super.mentor,
    required super.price,
    required super.sale,
    required super.rating,
    required super.image,
    required super.siswa,
    required super.slug,
    required super.linkmarketplace,
    required super.tanggalMulai,
    required super.tanggalSelesai,
  });

  factory AllEcomPrakerjaDto.fromJson(Map<String, dynamic> json) =>
      AllEcomPrakerjaDto(
        id: json['id'],
        title: json['title'],
        mentor: json['mentor'],
        price: json['price'],
        sale: json['sale'],
        rating: json['rating'],
        image: json['image'],
        siswa: json['siswa'],
        slug: json['slug'],
        linkmarketplace: json['linkmarketplace'],
        tanggalMulai: json['tanggalMulai'],
        tanggalSelesai: json['tanggalSelesai'],
      );
}

class LinkMarketPlaceDto extends Linkmarketplace {
  LinkMarketPlaceDto({
    required super.bukalapakCom,
    required super.karierMu,
    required super.maubelajarapaCom,
    required super.pijarmahirId,
    required super.pintariaCom,
    required super.tokopediaCom,
  });

  factory LinkMarketPlaceDto.fromJson(Map<String, dynamic> json) =>
      LinkMarketPlaceDto(
        bukalapakCom: json['bukalapakCom'],
        karierMu: json['karierMu'],
        maubelajarapaCom: json['maubelajarapaCom'],
        pijarmahirId: json['pijarmahirId'],
        pintariaCom: json['pintariaCom'],
        tokopediaCom: json['tokopediaCom'],
      );
}
