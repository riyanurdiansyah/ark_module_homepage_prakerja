import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArkHomeRepository {
  Future<Either<Failure, List<HomeOneEcomEntity>>> fetchOneEcom(String ecom);
  Future<Either<Failure, List<AllEcomPrakerjaEntity>>> fetchNewAllEcom();
  Future<Either<Failure, SliderPrakerjaEntity>> fetchSliderPrakerja();
}
