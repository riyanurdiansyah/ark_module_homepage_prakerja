// To parse this JSON data, do
//
//     final sliderPrakerjaEntity = sliderPrakerjaEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

// SliderPrakerjaEntity sliderPrakerjaEntityFromJson(String str) =>
//     SliderPrakerjaEntity.fromJson(json.decode(str));

// String sliderPrakerjaEntityToJson(SliderPrakerjaEntity data) =>
//     json.encode(data.toJson());

// List<SliderDataPrakerjaEntity> sliderDataPrakerjaEntityFromJson(String str) =>
//     List<SliderDataPrakerjaEntity>.from(
//         json.decode(str).map((x) => SliderDataPrakerjaEntity.fromJson(x)));

// class SliderPrakerjaEntity {
//   SliderPrakerjaEntity({
//     this.success,
//     this.message,
//     required this.data,
//   });

//   bool? success;
//   String? message;
//   List<SliderDataPrakerjaEntity> data;

//   factory SliderPrakerjaEntity.fromJson(Map<String, dynamic> json) =>
//       SliderPrakerjaEntity(
//           success: json["success"],
//           message: json["message"],
//           data: json["data"] != null
//               ? List<SliderDataPrakerjaEntity>.from(
//                   json["data"].map((x) => SliderDataPrakerjaEntity.fromJson(x)),
//                 )
//               : <SliderDataPrakerjaEntity>[]);

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class SliderDataPrakerjaEntity {
//   SliderDataPrakerjaEntity({
//     this.name,
//     this.url,
//     this.type,
//     this.image,
//     this.index,
//     this.status,
//   });

//   String? name;
//   String? url;
//   String? type;
//   String? image;
//   String? index;
//   String? status;

//   factory SliderDataPrakerjaEntity.fromJson(Map<String, dynamic> json) =>
//       SliderDataPrakerjaEntity(
//         name: json["name"] ?? "",
//         url: json["url"] ?? "",
//         type: json["type"] ?? "",
//         image: json["image"] ?? "",
//         index: json["index"] ?? "",
//         status: json["status"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "url": url,
//         "type": type,
//         "image": image,
//         "index": index,
//         "status": status,
//       };
// }

String sliderEntityToJson(SliderPrakerjaEntity data) =>
    json.encode(data.toJson());

class SliderPrakerjaEntity extends Equatable {
  const SliderPrakerjaEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<SliderDataPrakerjaEntity> data;

  SliderPrakerjaEntity copyWith({
    bool? success,
    String? message,
    List<SliderDataPrakerjaEntity>? data,
  }) =>
      SliderPrakerjaEntity(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [success, message, data];
}

class SliderDataPrakerjaEntity {
  SliderDataPrakerjaEntity({
    required this.name,
    required this.url,
    required this.type,
    required this.image,
    required this.index,
    required this.status,
  });

  final String name;
  final String url;
  final String type;
  final String image;
  final String index;
  final String status;

  SliderDataPrakerjaEntity copyWith({
    String? name,
    String? url,
    String? type,
    String? image,
    String? index,
    String? status,
  }) =>
      SliderDataPrakerjaEntity(
        name: name ?? this.name,
        url: url ?? this.url,
        type: type ?? this.type,
        image: image ?? this.image,
        index: index ?? this.index,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "type": type,
        "image": image,
        "index": index,
        "status": status,
      };
}
