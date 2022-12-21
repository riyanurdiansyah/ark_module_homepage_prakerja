import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/repositories/ark_home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../ark_module_homepage_prakerja.dart';

class ArkUseCases {
  final ArkHomeRepository repository;
  ArkUseCases(this.repository);

  Future<Either<Failure, List<HomeOneEcomEntity>>> fetchOneEcom(
          String baseUrl, String ecom) async =>
      await repository.fetchOneEcom(baseUrl, ecom);

  Future<Either<Failure, List<AllEcomPrakerjaEntity>>> fetchNewAllEcom(
    String baseUrl,
  ) async =>
      await repository.fetchNewAllEcom(baseUrl);

  Future<Either<Failure, SliderPrakerjaEntity>> fetchSliderPrakerja(
          String baseUrl) async =>
      await repository.fetchSliderPrakerja(baseUrl);

  Future<Either<Failure, List<AllEcomPrakerjaDto>>> fetchPelatihanTerpopuler(
          String baseUrl) async =>
      await repository.fetchPelatihanTerpopuler(baseUrl);
}
