import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArkHomeRepository {
  Future<Either<Failure, List<HomeOneEcomEntity>>> fetchOneEcom(
      String baseUrl, String ecom);
  Future<Either<Failure, List<AllEcomPrakerjaEntity>>> fetchNewAllEcom(
      String baseUrl);
  Future<Either<Failure, SliderPrakerjaEntity>> fetchSliderPrakerja(
      String baseUrl);
  Future<Either<Failure, List<AllEcomPrakerjaDto>>> fetchPelatihanTerpopuler(
      String baseUrl);
}
