import 'dart:developer';

import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_home_remote_datasources.dart';
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
      '$prakerjaUrl/wp-json/api/arkademi/prakerja-marketplace/$ecom',
      options: dioOptions,
    );
    List<HomeOneEcomEntity> oneEcom = [];
    int code = response.statusCode ?? 500;
    if (code == 200) {
      oneEcom.add(HomeOneEcomEntity.fromJson(response.data));

      // for (var element in response.data) {
      //   log('ECOM $element');
      //   log('ECOM RESPONSE ${response.data}');

      //   oneEcom.add(HomeOneEcomEntity.fromJson(element));
      //   log('FROM ONE ECOM ${oneEcom.length}');
      //   return oneEcom;
      // }
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
    List<AllEcomPrakerjaEntity> allEcom = [];
    int code = response.statusCode ?? 500;
    if (code == 200) {
      for (var data in response.data) {
        allEcom.add(AllEcomPrakerjaEntity.fromJson(data));
        return allEcom;
      }
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
}
