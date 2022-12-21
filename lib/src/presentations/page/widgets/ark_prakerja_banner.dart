import 'dart:developer';

import 'package:ark_module_homepage_prakerja/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkPrakerjaBanner extends StatelessWidget {
  final bool isWebinar;

  const ArkPrakerjaBanner({Key? key, this.isWebinar = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isWebinar == true
        ? Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        log('TUKAR VOUCHER PRESSED');
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final isLogin = prefs.getBool('user_login') ?? false;
                        if (isLogin == true) {
                          Get.toNamed(
                            '/ark-verification-coupon-prakerja',
                          );
                        } else {
                          Get.toNamed('/signup');
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo-1-prakerja.svg',
                              height: 35, fit: BoxFit.fill),
                          const SizedBox(height: 8),
                          const Text(
                            'Tukar Voucher',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff194476),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 53,
                    color: const Color(0xffF1F2F4),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/check-ceritificate-prakerja");
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/logo-2-prakerja.svg',
                                height: 35,
                                fit: BoxFit.fill),
                            const SizedBox(height: 8),
                            const Text(
                              'Cek Sertifikat',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff194476),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    width: 1,
                    height: 53,
                    color: const Color(0xffF1F2F4),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed("/prakerja-webview");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo-3-prakerja.svg',
                              height: 35, fit: BoxFit.fill),
                          const SizedBox(height: 8),
                          const Text(
                            'Panduan Pelatihan',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff194476),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Card(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final isLogin = prefs.getBool('user_login') ?? false;
                    if (isLogin == true) {
                      Get.toNamed(
                        '/ark-verification-coupon-prakerja',
                      );
                    } else {
                      Get.toNamed('/signup');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/logo-1-prakerja.svg',
                            height: 35, fit: BoxFit.fill),
                        const SizedBox(height: 8),
                        const Text(
                          'Tukar Voucher',
                          style: TextStyle(
                              fontSize: 9.5, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1.2,
                  height: 45,
                  color: kNewBlack5a,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/check-ceritificate-prakerja");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo-2-prakerja.svg',
                              height: 35, fit: BoxFit.fill),
                          const SizedBox(height: 8),
                          const Text(
                            'Cek Sertifikat',
                            style: TextStyle(
                                fontSize: 9.5, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )),
                Container(
                  width: 1.2,
                  height: 45,
                  color: kNewBlack5a,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/prakerja-webview");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/logo-3-prakerja.svg',
                            height: 35, fit: BoxFit.fill),
                        const SizedBox(height: 8),
                        const Text(
                          'Panduan Pelatihan',
                          style: TextStyle(
                              fontSize: 9.5, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            // ),
          );
  }
}
