import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_m.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCourseRepository {
  Future<Either<Failure, HomeOneEcom>> fetchOneEcom(String ecom);
}
