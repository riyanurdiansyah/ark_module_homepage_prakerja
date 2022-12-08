import 'dart:developer';

import 'package:ark_module_homepage_prakerja/src/core/exception_handling.dart';
import 'package:ark_module_homepage_prakerja/src/data/datasources/remote/ark_home_remote_datasources_impl.dart';
import 'package:ark_module_homepage_prakerja/src/data/repositories/ark_home_impl_repository.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_prakerja_ecom_lumen_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_slider_prakerja_entity.dart';
import 'package:ark_module_homepage_prakerja/src/domain/usecases/ark_home_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkHomePagePrakerjaController extends GetxController {
  // LOADING VARIABLES
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  final RxBool _isLoadingEcom = false.obs;
  RxBool get isLoadingEcom => _isLoadingEcom;
  final RxBool _isLoadingSliderPrakerja = false.obs;
  RxBool get isLoadingSliderPrakerja => _isLoadingSliderPrakerja;

  // FOR ECOM
  RxList<HomeOneEcomEntity> homeEcom = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> listHomeEcom = <HomeOneEcomEntity>[].obs;
  Rx<int> ecommSelected = 99.obs;

  RxList<AllEcomPrakerjaEntity> mainEcomNewClasses =
      <AllEcomPrakerjaEntity>[].obs;
  // RxList<PrakerjaEcomClassLumenEntity> allEcomNewClasses =
  //     <PrakerjaEcomClassLumenEntity>[].obs;

  RxList<dynamic> mainList = <dynamic>[].obs;
  RxList<HomeOneEcomEntity> tokopediaList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> bukalapakList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> sekolahmuList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> pintariaList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> pijarMahirList = <HomeOneEcomEntity>[].obs;
  RxList<HomeOneEcomEntity> lazadaList = <HomeOneEcomEntity>[].obs;

  // FOR BANNER
  final Rx<SliderPrakerjaEntity> _sliderImage =
      SliderPrakerjaEntity(success: false, data: [], message: '').obs;
  Rx<SliderPrakerjaEntity> get sliderImage => _sliderImage;

  late ArkUseCases _useCases;
  late ArkHomeRepositoryImpl _repository;
  late ArkHomeRemoteDatasourcesImpl _dataSource;
  late ScrollController scrollControllerPage;

  RxList<Widget> slidersFromBackend = <Widget>[].obs;
  // RxList<String> tempSliders = <String>[
  //   'https://images.unsplash.com/photo-1664575198263-269a022d6e14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  //   'https://images.unsplash.com/photo-1664575197229-3bbebc281874?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  //   'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  // ].obs;

  @override
  void onInit() async {
    _changeLoading(true);
    super.onInit();
    await _setup();
    fetchAllNewEcom();
    fetchSliderPrakerja();
    await _changeLoading(false);
  }

  Future _setup() async {
    //INITIALIZE DATASOURCE
    _dataSource = ArkHomeRemoteDatasourcesImpl();
    //INITIALIZE REPOSITORY
    _repository = ArkHomeRepositoryImpl(_dataSource);
    //INITIALIZE USECASE
    _useCases = ArkUseCases(_repository);
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
    final response = await _useCases.fetchSliderPrakerja();
    response.fold((l) {
      log('RESPONSE ERROR FETCH SLIDER PRAKERJA $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      _sliderImage.value = r;
    });
    await _changeLoadingSlider(false);
  }

  Future<List<AllEcomPrakerjaEntity>> fetchAllNewEcom() async {
    _changeLoadingEcom(true);
    final response = await _useCases.fetchNewAllEcom();
    response.fold((l) {
      log('RESPONSE ERROR FETCH ALL NEW ECOM $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      log('RESPONSE SUCCESS FETCH ALL NEW ECOM $r');
      return mainEcomNewClasses.value = r;
    });
    _changeLoadingEcom(false);
    return mainEcomNewClasses;
  }

  // FETCH ECOM
  Future fetchOneEcom(String ecom) async {
    _changeLoadingEcom(true);
    final response = await _useCases.fetchOneEcom(ecom);
    response.fold((l) {
      return ExceptionHandle.execute(l);
    }, (r) {
      homeEcom.value = r;
      listHomeEcom.assignAll(homeEcom);
      if (ecom == 'tokopedia') {
        tokopediaList.assignAll(listHomeEcom);
      } else if (ecom == 'bukalapak') {
        bukalapakList.assignAll(listHomeEcom);
      } else if (ecom == 'sekolahmu') {
        sekolahmuList.assignAll(listHomeEcom);
      } else if (ecom == 'pintaria') {
        pintariaList.assignAll(listHomeEcom);
      } else {
        pijarMahirList.assignAll(listHomeEcom);
      }
    });
    _changeLoadingEcom(false);
  }

  // void addSlider() {
  //   _changeLoading(true);
  //   slidersFromBackend.assignAll([
  //     for (int i = 0; i < tempSliders.length; i++)
  //       GestureDetector(
  //         // onTap: () => launchUrl(Uri.parse(cacheData[i]['url']),
  //         //     mode: LaunchMode.externalApplication),

  //         // onTap: cacheData[i]['id'] == '32'
  //         //     ? () => Get.to(() => const ClassCoinPage())
  //         //     : cacheData[i]['hyperlink'] != ""
  //         //         ? () => launchUrl(Uri.parse(cacheData[i]['hyperlink']),
  //         //             mode: LaunchMode.externalApplication)
  //         //         : () {},
  //         child: SizedBox(
  //           height: 170,
  //           width: Get.size.width - 34,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(6),
  //             child: Image.network(
  //               tempSliders[i],
  //               fit: BoxFit.fill,
  //               width: double.infinity,
  //               errorBuilder: (_, __, ___) {
  //                 return ErrorNetworkImageWidgets(
  //                   child: Image.asset(
  //                     'assets/images/logo-arkademi.png',
  //                     fit: BoxFit.fill,
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       )
  //   ]);
  //   _changeLoading(false);
  // }
}
