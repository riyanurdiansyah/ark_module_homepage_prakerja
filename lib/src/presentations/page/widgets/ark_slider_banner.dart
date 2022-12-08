import 'package:ark_module_homepage_prakerja/src/presentations/page/controller/ark_home_pake_controller.dart';
import 'package:ark_module_homepage_prakerja/widgets/error_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ark_module_homepage_prakerja.dart';

class ArkPrakerjaSliderFromBackend extends StatelessWidget {
  final ArkHomePagePrakerjaController controller;

  ArkPrakerjaSliderFromBackend({Key? key, required this.controller})
      : super(key: key);

  final _sliderIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoadingSliderPrakerja.value == true
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
                          _sliderIndex.value = index;
                        }),
                    // items: controller.slidersFromBackend,
                    items: List.generate(
                        controller.sliderImage.value.data.length,
                        (index) => GestureDetector(
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
                                    controller
                                        .sliderImage.value.data[index].image,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    errorBuilder: (_, __, ___) {
                                      return ErrorNetworkImageWidgets(
                                        child: Image.network(
                                          // 'assets/images/logo-arkademi.png',
                                          'https://images.unsplash.com/photo-1623018035782-b269248df916?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                Obx(
                  () => Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            //  controller.slidersFromBackend.map((url) {
                            // int index = controller.slidersFromBackend.indexOf(url);
                            List.generate(
                          controller.sliderImage.value.data.length,
                          (index) => Container(
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
                          ),
                        )
                        // }).toList(),
                        ),
                  ),
                ),
              ],
            ),
    );
  }
}
