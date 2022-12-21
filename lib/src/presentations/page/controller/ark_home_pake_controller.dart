import 'dart:developer';

import 'package:ark_module_homepage_prakerja/src/core/exception_handling.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_home_remote_datasources_impl.dart';
import 'package:ark_module_homepage_prakerja/src/data/dto/ark_all_ecom_dto.dart';
import 'package:ark_module_homepage_prakerja/src/data/repositories/ark_home_impl_repository.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/usecases/ark_home_usecases.dart';
import 'package:ark_module_homepage_prakerja/utils/app_empty_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkHomePagePrakerjaController extends GetxController {
  // LOADING VARIABLES
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  final RxBool _isLoadingEcom = false.obs;
  RxBool get isLoadingEcom => _isLoadingEcom;
  final RxBool _isLoadingSliderPrakerja = false.obs;
  RxBool get isLoadingSliderPrakerja => _isLoadingSliderPrakerja;

  // FOR ECOM
  final RxList<HomeOneEcomEntity> _homeEcom = <HomeOneEcomEntity>[].obs;
  final RxList<HomeOneEcomEntity> _listHomeEcom = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> get listHomeEcome => _listHomeEcom;
  Rx<int> ecommSelected = 99.obs;
  final RxList<AllEcomPrakerjaEntity> _mainEcomNewClasses =
      <AllEcomPrakerjaEntity>[].obs;
  RxList<AllEcomPrakerjaEntity> get mainEcomNewClassess => _mainEcomNewClasses;

  final RxList<AllEcomPrakerjaDto> _pelatihanTerpopuler =
      <AllEcomPrakerjaDto>[].obs;
  RxList<AllEcomPrakerjaDto> get pelatihanTerpopuler => _pelatihanTerpopuler;

  RxList<HomeOneEcomEntity> tokopediaList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> bukalapakList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> sekolahmuList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> pintariaList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> pijarMahirList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> lazadaList = <HomeOneEcomEntity>[].obs;

  // FOR BANNER
  final Rx<SliderPrakerjaEntity> _sliderImage = emptySlider.obs;
  Rx<SliderPrakerjaEntity> get sliderImage => _sliderImage;

  late ArkUseCases _useCases;
  late ArkHomeRepositoryImpl _repository;
  late ArkHomeRemoteDatasourcesImpl _dataSource;
  late ScrollController scrollControllerPage;

  // FOR INDEXING BOTTOM NAVBAR ON BELI DI MARKETPLACE PILIHANMU
  final Rx<int> _indexBeliDiMarketPlace = 0.obs;
  Rx<int> get indexBeliDiMarketPlace => _indexBeliDiMarketPlace;

  final Rx<String> _baseUrlApiCourse = "".obs;
  final Rx<String> _baseUrlApiMember = "".obs;

  late SharedPreferences _pref;
  @override
  void onInit() async {
    _changeLoading(true);
    super.onInit();
    // await _fetchConfig();
    await _setup();
    fetchAllNewEcomWebinar();
    fetchSliderPrakerja();
    fetchPelatihanTerpopuler();
    await _changeLoading(false);
  }

  Future _setup() async {
    _pref = await SharedPreferences.getInstance();
    //INITIALIZE DATASOURCE
    _dataSource = ArkHomeRemoteDatasourcesImpl();
    //INITIALIZE REPOSITORY
    _repository = ArkHomeRepositoryImpl(_dataSource);
    //INITIALIZE USECASE
    _useCases = ArkUseCases(_repository);

    // _baseUrlWp.value = _pref.getString("prakerja_api_wp_url")!;
    _baseUrlApiCourse.value = _pref.getString("prakerja_api_course_url")!;
    _baseUrlApiMember.value = _pref.getString("prakerja_api_member_url")!;
  }

  Future<bool> _changeLoading(bool val) async {
    _isLoading.value = val;
    return val;
  }

  Future<bool> _changeLoadingEcom(bool val) async {
    _isLoadingEcom.value = val;
    return val;
  }

  Future<bool> _changeLoadingSlider(bool val) async {
    _isLoadingEcom.value = val;
    return val;
  }

  void fetchSliderPrakerja() async {
    _changeLoadingSlider(true);
    final response =
        await _useCases.fetchSliderPrakerja(_baseUrlApiCourse.value);
    response.fold((l) {
      log('RESPONSE ERROR FETCH SLIDER PRAKERJA $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      _sliderImage.value = r;
    });
    await _changeLoadingSlider(false);
  }

  Future<List<AllEcomPrakerjaDto>> fetchPelatihanTerpopuler() async {
    final response =
        await _useCases.fetchPelatihanTerpopuler(_baseUrlApiCourse.value);
    response.fold((l) {
      log('RESPONSE ERROR FETCH PELATIHAN TERPOPULER $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      _pelatihanTerpopuler.value = r;
    });
    return _pelatihanTerpopuler;
  }

  Future<List<AllEcomPrakerjaEntity>> fetchAllNewEcomWebinar() async {
    log("CEK WOI");
    _changeLoadingEcom(true);
    final response = await _useCases.fetchNewAllEcom(_baseUrlApiCourse.value);
    response.fold((l) {
      log('RESPONSE ERROR FETCH ALL NEW ECOM $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      return _mainEcomNewClasses.value = r;
    });
    await _changeLoadingEcom(false);
    return _mainEcomNewClasses;
  }

  Future<List<AllEcomPrakerjaEntity>> fetchAllNewEcom() async {
    _changeLoadingEcom(true);
    final response = await _useCases.fetchNewAllEcom(_baseUrlApiCourse.value);
    response.fold((l) {
      log('RESPONSE ERROR FETCH ALL NEW ECOM $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      return _mainEcomNewClasses.value = r;
    });
    await _changeLoadingEcom(false);
    return _mainEcomNewClasses;
  }

  // FETCH ECOM
  Future fetchOneEcom(String ecom) async {
    _changeLoadingEcom(true);
    final response =
        await _useCases.fetchOneEcom(_baseUrlApiCourse.value, ecom);
    response.fold((l) {
      return ExceptionHandle.execute(l);
    }, (r) {
      _listHomeEcom.value = [];
      _homeEcom.value = r;
      _listHomeEcom.assignAll(_homeEcom);
      if (ecom == 'tokopedia') {
        tokopediaList.assignAll(_listHomeEcom);
      } else if (ecom == 'bukalapak') {
        bukalapakList.assignAll(_listHomeEcom);
      } else if (ecom == 'sekolahmu') {
        sekolahmuList.assignAll(_listHomeEcom);
      } else if (ecom == 'pintaria') {
        pintariaList.assignAll(_listHomeEcom);
      } else {
        pijarMahirList.assignAll(_listHomeEcom);
      }
    });
    await _changeLoadingEcom(false);
  }
}
