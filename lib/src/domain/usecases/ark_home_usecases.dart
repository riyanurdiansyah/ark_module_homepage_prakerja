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
          String ecom) async =>
      await repository.fetchOneEcom(ecom);

  Future<Either<Failure, List<AllEcomPrakerjaEntity>>>
      fetchNewAllEcom() async => await repository.fetchNewAllEcom();

  Future<Either<Failure, SliderPrakerjaEntity>> fetchSliderPrakerja() async =>
      await repository.fetchSliderPrakerja();
}
