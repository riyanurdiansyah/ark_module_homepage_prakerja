import 'package:ark_module_homepage_prakerja/widgets/error_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkHomePagePrakerjaController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  RxList<Widget> slidersFromBackend = <Widget>[].obs;
  RxList<String> tempSliders = <String>[
    'https://images.unsplash.com/photo-1664575198263-269a022d6e14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1664575197229-3bbebc281874?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  ].obs;

  @override
  void onReady() {
    super.onReady();
    addSlider();
  }

  Future<bool> _changeLoading(bool val) async {
    _isLoading.value = val;
    return val;
  }

  void addSlider() {
    _changeLoading(true);
    slidersFromBackend.assignAll([
      for (int i = 0; i < tempSliders.length; i++)
        GestureDetector(
          // onTap: () => launchUrl(Uri.parse(cacheData[i]['url']),
          //     mode: LaunchMode.externalApplication),

          // onTap: cacheData[i]['id'] == '32'
          //     ? () => Get.to(() => const ClassCoinPage())
          //     : cacheData[i]['hyperlink'] != ""
          //         ? () => launchUrl(Uri.parse(cacheData[i]['hyperlink']),
          //             mode: LaunchMode.externalApplication)
          //         : () {},
          child: SizedBox(
            height: 170,
            width: Get.size.width - 34,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                tempSliders[i],
                fit: BoxFit.fill,
                width: double.infinity,
                errorBuilder: (_, __, ___) {
                  return ErrorNetworkImageWidgets(
                    child: Image.asset(
                      'assets/images/logo-arkademi.png',
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          ),
        )
    ]);
    _changeLoading(false);
  }
}
