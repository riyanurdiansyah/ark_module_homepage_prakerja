import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';

class SliderPrakerjaDto extends SliderPrakerjaEntity {
  SliderPrakerjaDto({
    required super.success,
    required super.message,
    required super.data,
  });

  factory SliderPrakerjaDto.fromJson(Map<String, dynamic> json) {
    return SliderPrakerjaDto(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: List<SliderDataPrakerjaDto>.from(
          json["data"].map((x) => SliderDataPrakerjaDto.fromJson(x)),
        ));
  }
}

class SliderDataPrakerjaDto extends SliderDataPrakerjaEntity {
  SliderDataPrakerjaDto({
    required super.image,
    required super.index,
    required super.name,
    required super.status,
    required super.type,
    required super.url,
  });

  factory SliderDataPrakerjaDto.fromJson(Map<String, dynamic> json) =>
      SliderDataPrakerjaDto(
        image: json['image'] ?? "",
        index: json['index'] ?? "",
        name: json['name'] ?? "",
        status: json['status'] ?? "",
        type: json['type'] ?? "",
        url: json['url'] ?? "",
      );
}
