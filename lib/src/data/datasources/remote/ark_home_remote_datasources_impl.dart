import 'dart:convert';
import 'dart:developer';

import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_home_remote_datasources.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_slider_prakerja_dto.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/utils/app_url.dart';
import 'package:dio/dio.dart';

class ArkHomeRemoteDatasourcesImpl implements ArkHomeRemoteDatasources {
  late Dio dio;
  ArkHomeRemoteDatasourcesImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<List<HomeOneEcomEntity>> fetchOneEcom(String ecom) async {
    final response = await dio.get(
      // '$prakerjaUrl/wp-json/api/arkademi/prakerja-marketplace/$ecom',
      '$prakerjaUrlStaging/api/v1/prakerja/get_prakerja_marketplace_course?mp_name=$ecom',
      options: dioOptions,
    );
    List<HomeOneEcomEntity> oneEcom = [];
    int code = response.statusCode ?? 500;

    if (code == 200) {
      final jsonResponse = jsonDecode(jsonEncode(response.data));
      for (int i = 0; i < jsonResponse.length; i++) {
        log('ONE ECOM $jsonResponse');
        oneEcom.add(HomeOneEcomEntity.fromJson(jsonResponse[i]));
      }

      log('FROM ONE ECOM ${oneEcom.length}');
      return oneEcom;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Fetch Ecom... failed connect to server',
    );
  }

  @override
  Future<List<AllEcomPrakerjaEntity>> fetchNewAllEcom() async {
    final response = await dio.get(
      '$prakerjaUrlStaging/api/v1/prakerja/get_prakerja_marketplace_course',
      options: dioOptions,
    );
    List<AllEcomPrakerjaDto> allEcom = [];
    int code = response.statusCode ?? 500;
    if (code == 200) {
      final jsonResponse = jsonDecode(jsonEncode(response.data));
      for (int i = 0; i < jsonResponse.length; i++) {
        allEcom.add(AllEcomPrakerjaDto.fromJson(jsonResponse[i]));
      }

      log('FROM ALL ECOM ${allEcom.length}');
      return allEcom;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Fetch All New Ecom... failed connect to server',
    );
  }

  @override
  Future<SliderPrakerjaDto> fetchSliderPrakerja() async {
    final response = await dio.get(
      "$prakerjaUrlStaging/api/v1/prakerja/homepage/banner/mobile",
      options: dioOptions,
    );
    int code = response.statusCode ?? 500;
    log("DATA CEK : ${response.data}");
    if (code == 200) {
      return SliderPrakerjaDto.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Fetch Slider... failed connect to server',
    );
  }

  @override
  Future<List<AllEcomPrakerjaDto>> fetchPelatihanTerpopuler() async {
    final response = await dio.get(
      "$prakerjaUrlStaging/api/v1/prakerja/get_prakerja_popular_course",
      options: dioOptions,
    );
    List<AllEcomPrakerjaDto> pelatihanTerpopuler = [];

    int code = response.statusCode ?? 500;
    if (code == 200) {
      final jsonResponse = jsonDecode(jsonEncode(response.data));

      for (int i = 0; i < jsonResponse.length; i++) {
        pelatihanTerpopuler.add(AllEcomPrakerjaDto.fromJson(jsonResponse[i]));
        return pelatihanTerpopuler;
      }
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Fetch Pelatihan Terpouler... failed connect to server',
    );
  }
}
