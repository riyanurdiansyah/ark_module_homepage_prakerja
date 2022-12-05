import 'dart:developer';

import 'package:ark_module_homepage_prakerja/src/core/exception_handling.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_course_remote_datasources.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_m.dart';
import 'package:ark_module_homepage_prakerja/utils/app_url.dart';
import 'package:dio/dio.dart';

class ArkCourseRemoteDatasourcesImpl implements ArkCourseRemoteDatasources {
  late Dio dio;
  ArkCourseRemoteDatasourcesImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<HomeOneEcom> fetchOneEcom(String ecom) async {
    final response = await dio
        .get('$prakerjaUrl/wp-json/api/arkademi/prakerja-marketplace/$ecom');
    int code = response.statusCode ?? 500;
    if (code == 200) {
      log('RESPONSE FROM COURSE JRC ${response.data}');
      return HomeOneEcom.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Detail Course JRC... failed connect to server',
    );
  }
}
