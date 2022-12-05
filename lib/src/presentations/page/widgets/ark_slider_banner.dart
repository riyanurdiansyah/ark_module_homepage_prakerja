import 'package:ark_module_homepage_prakerja/src/presentations/page/controller/ark_home_pake_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ark_module_homepage_prakerja.dart';

class ArkPrakerjaSliderFromBackend extends StatelessWidget {
  final _sliderIndex = 0.obs;

  ArkPrakerjaSliderFromBackend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _phC = Get.put(ArkHomePagePrakerjaController());
    return Obx(
      () => _phC.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Obx(
                  () => CarouselSlider(
                    options: CarouselOptions(
                        height: 150,
                        autoPlayInterval: const Duration(seconds: 8),
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          // _phC.swipeSlider(index);
                          _sliderIndex.value = index;
                        }),
                    items: _phC.slidersFromBackend,
                  ),
                ),
                Obx(
                  () => Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _phC.slidersFromBackend.map((url) {
                        int index = _phC.slidersFromBackend.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 2.0, right: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: _sliderIndex.value == index
                                ? Border.all(width: 0.2, color: kNewBlack2b)
                                : Border.all(width: 0.6, color: kNewBlack2b),
                            color: _sliderIndex.value == index
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
