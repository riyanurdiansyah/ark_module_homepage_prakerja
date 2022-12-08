import 'package:ark_module_homepage_prakerja/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArkPrakerjaBanner extends StatelessWidget {
  final bool isWebinar;

  const ArkPrakerjaBanner({Key? key, this.isWebinar = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isWebinar == true
        ? Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // final isLogin = prefs.getBool('user_login') ?? false;
                      // if (isLogin == true) {
                      //   Get.to(() => VerificationCouponPage(),
                      //       transition: Transition.rightToLeft,
                      //       curve: Curves.easeInOut);
                      // } else {
                      //   Get.to(() => RegistPage(),
                      //       transition: Transition.downToUp);
                      // }
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
                  Container(
                    width: 1,
                    height: 53,
                    color: const Color(0xffF1F2F4),
                  ),
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => CheckCertificatePrakerjaPage());
                        // Get.to(() => PrakerjaWebView(false),
                        //     transition: Transition.rightToLeft,
                        //     curve: Curves.easeInOut);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo-2-prakerja.svg',
                              height: 35, fit: BoxFit.fill),
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
                  Container(
                    width: 1,
                    height: 53,
                    color: const Color(0xffF1F2F4),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => PrakerjaWebView(true),
                      //     transition: Transition.rightToLeft,
                      //     curve: Curves.easeInOut);
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
                    // SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // final isLogin = prefs.getBool('user_login') ?? false;
                    // if (isLogin == true) {
                    //   Get.to(() => VerificationCouponPage(),
                    //       transition: Transition.rightToLeft,
                    //       curve: Curves.easeInOut);
                    // } else {
                    //   Get.to(() => RegistPage(),
                    //       transition: Transition.downToUp);
                    // }
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
                      // Get.to(() => CheckCertificatePrakerjaPage());
                      // Get.to(() => PrakerjaWebView(false),
                      //     transition: Transition.rightToLeft,
                      //     curve: Curves.easeInOut);
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
                    // Get.to(() => PrakerjaWebView(true),
                    //     transition: Transition.rightToLeft,
                    //     curve: Curves.easeInOut);
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
