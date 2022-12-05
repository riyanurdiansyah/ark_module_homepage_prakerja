import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_m.dart';
import 'package:ark_module_homepage_prakerja/src/domain/repositories/ark_course_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../ark_module_homepage_prakerja.dart';

class ArkUseCases {
  final ArkCourseRepository _repository;

  ArkUseCases({required ArkCourseRepository repository})
      : _repository = repository;

  Future<Either<Failure, HomeOneEcom>> fetchOneEcom(String ecom) async =>
      await _repository.fetchOneEcom(ecom);
}
