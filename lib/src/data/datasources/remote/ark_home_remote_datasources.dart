import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_slider_prakerja_dto.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';

abstract class ArkHomeRemoteDatasources {
  Future<List<HomeOneEcomEntity>> fetchOneEcom(String baseUrl, String ecom);
  Future<List<AllEcomPrakerjaEntity>> fetchNewAllEcom(String baseUrl);
  Future<List<AllEcomPrakerjaDto>> fetchPelatihanTerpopuler(String baseUrl);
  Future<SliderPrakerjaDto> fetchSliderPrakerja(String baseUrl);
}
