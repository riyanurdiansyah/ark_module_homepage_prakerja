import 'package:cloud_firestore/cloud_firestore.dart';

class NewConfigEntity {
  NewConfigEntity({
   required this.prakerja,
  });

 final  PrakerjaConfigM prakerja;

  factory NewConfigEntity.fromJson(Map<String, dynamic> json) =>
      NewConfigEntity(
        prakerja: PrakerjaConfigM.fromJson(json["prakerja"]),
      );
}

class PrakerjaConfigM {
  PrakerjaConfigM({
    required this.baseUrl,
    required this.maintenance,
    required this.maintenanceEnd,
    required this.newUrl,
    required this.prakerjaApiMemberUrl,
    required this.prakerjaApiCourseUrl,
  });

  final String baseUrl;
  final bool maintenance;
  final Timestamp maintenanceEnd;
  final bool newUrl;
  final String prakerjaApiMemberUrl;
  final String prakerjaApiCourseUrl;

  factory PrakerjaConfigM.fromJson(Map<String, dynamic> json) =>
      PrakerjaConfigM(
        baseUrl: json["base_url"],
        maintenance: json["maintenance"],
        maintenanceEnd: json["maintenance_end"],
        newUrl: json["new_url"],
        prakerjaApiCourseUrl: json["api_course_url"],
        prakerjaApiMemberUrl: json["api_member_url"],
      );
}
