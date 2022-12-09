import 'dart:developer';

import 'package:ark_module_homepage_prakerja/src/core/exception_handling.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_home_remote_datasources.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/core/error/failures.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/repositories/ark_home_repository.dart';
import 'package:dartz/dartz.dart';

class ArkHomeRepositoryImpl implements ArkHomeRepository {
  final ArkHomeRemoteDatasources datasources;
  ArkHomeRepositoryImpl(this.datasources);

  @override
  Future<Either<Failure, List<HomeOneEcomEntity>>> fetchOneEcom(
      String ecom) async {
    try {
      final responseEcom = await datasources.fetchOneEcom(ecom);
      return Right(responseEcom);
    } catch (e) {
      log("ERROR REPO IMPL HOME FETCH ONE ECOM: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<AllEcomPrakerjaEntity>>> fetchNewAllEcom() async {
    try {
      final response = await datasources.fetchNewAllEcom();
      return Right(response);
    } catch (e) {
      log("ERROR REPO IMPL HOME REPO FETCH ALL NEW ECOM: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, SliderPrakerjaEntity>> fetchSliderPrakerja() async {
    try {
      final response = await datasources.fetchSliderPrakerja();
      return Right(response);
    } catch (e) {
      log("ERROR REPO IMPL HOME REPO FETCH SLIDER PRAKERJA: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<AllEcomPrakerjaDto>>>
      fetchPelatihanTerpopuler() async {
    try {
      final response = await datasources.fetchPelatihanTerpopuler();
      return Right(response);
    } catch (e) {
      log("ERROR REPO IMPL HOME REPO FETCH PELATIHAN TERPOPULER: ${e.toString()}");

      return ExceptionHandleResponse.execute(e);
    }
  }
}
