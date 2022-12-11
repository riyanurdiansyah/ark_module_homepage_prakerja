import 'dart:developer';
import 'dart:io';

import 'package:ark_module_homepage_prakerja/src/presentations/page/controller/ark_home_pake_controller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color.dart';

class ArkBeliDiMarketPlaceWebinar extends StatefulWidget {
  final int index;
  const ArkBeliDiMarketPlaceWebinar({Key? key, required this.index})
      : super(key: key);

  @override
  State<ArkBeliDiMarketPlaceWebinar> createState() =>
      _ArkBeliDiMarketPlaceWebinarState();
}

class _ArkBeliDiMarketPlaceWebinarState
    extends State<ArkBeliDiMarketPlaceWebinar> {
  int args = Get.arguments;

  final _prakerjaHc = Get.find<ArkHomePagePrakerjaController>();

  final List marketPlaceWebinar = [
    {'icon': 'assets/images/logo_tokopedia_prakerja.png', 'title': 'tokopedia'},
    {'icon': 'assets/images/logo_bukalapak_prakerja.png', 'title': 'bukalapak'},
    {'icon': 'assets/images/logo_sekolahmu_prakerja.png', 'title': 'sekolahmu'},
    {'icon': 'assets/images/logo_pintar_prakerja.png', 'title': 'pintaria'},
    {
      'icon': 'assets/images/logo_pijarmahir_prakerja.png',
      'title': 'pijarmahir'
    },
  ];

  static const List<Map<String, dynamic>> _newNavbarPrakerja = [
    {
      'icon_select': 'assets/images/home_icon_active.png',
      'icon_deselect': 'assets/images/home_icon_deselect.png',
      'text': 'Home'
    },
    {
      'icon_select': 'assets/images/kelas_saya_icon.png',
      'icon_deselect': 'assets/images/kelas_saya_icon.png',
      'text': 'Pelatihan Saya'
    },
    {
      'icon_select': 'assets/images/profile_icon_active.png',
      'icon_deselect': 'assets/images/profile_icon_deselect.png',
      'text': 'Profile'
    },
  ];

  @override
  Widget build(BuildContext context) {
    log(args.toString());
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: [
                const Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: 52,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      marketPlaceWebinar.length,
                      (i) => Obx(
                        () => GestureDetector(
                          onTap: () {
                            _prakerjaHc.ecommSelected.value = i;
                            switch (i) {
                              case 0:
                                {
                                  if (_prakerjaHc.tokopediaList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.mainList.value =
                                      _prakerjaHc.tokopediaList;
                                }
                                break;
                              case 1:
                                {
                                  if (_prakerjaHc.bukalapakList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.mainList.value =
                                      _prakerjaHc.bukalapakList;
                                }
                                break;

                              case 2:
                                {
                                  if (_prakerjaHc.sekolahmuList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.mainList.value =
                                      _prakerjaHc.sekolahmuList;
                                }
                                break;
                              case 4:
                                {
                                  if (_prakerjaHc.pijarMahirList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.mainList.value =
                                      _prakerjaHc.pijarMahirList;
                                }
                                break;
                            }
                          },
                          child: Container(
                            width: 105,
                            margin: EdgeInsets.only(
                                right:
                                    i == marketPlaceWebinar.length - 1 ? 0 : 7,
                                left: i == 0 ? 7 : 0,
                                bottom: 7,
                                top: 7),
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: _prakerjaHc.ecommSelected.value == i
                                      ? const Color(0xff5291DB)
                                      : kNewBlack4),
                            ),
                            child: Image.asset(
                              '${marketPlaceWebinar[i]['icon']}',
                              height: 13,
                              fit: BoxFit.fitHeight,
                              opacity: _prakerjaHc.ecommSelected.value == i
                                  ? null
                                  : const AlwaysStoppedAnimation(.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            )),
        iconTheme: const IconThemeData(color: kNewBlack2a),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Beli di Marketplace Pilihanmu',
          style: TextStyle(
              fontSize: 14.5, fontWeight: FontWeight.bold, color: kNewBlack2a),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => _prakerjaHc.isLoadingEcom.value == false &&
                    _prakerjaHc.mainEcomNewClassess.isEmpty
                ? const Center(child: Text('Tidak ada kelas'))
                : _prakerjaHc.isLoadingEcom.value == true
                    ? ListView(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: List.generate(
                          5,
                          (index) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 13,
                                right: index == 5 - 1 ? 0 : 10,
                              ),
                              width: Get.width / 2.4,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromRGBO(222, 240, 255, 1)),
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _prakerjaHc.mainEcomNewClassess.length,
                        itemBuilder: (context, i) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6),
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                    width: 97,
                                    height: 137,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 22, bottom: 14, top: 11),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 11,
                                            vertical: 3,
                                          ),
                                          // width: 127,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: const Color(0xff234061),
                                          ),
                                          child: const Text(
                                            '28 Nov - 3 Des 2022',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'Menerapkan Prinsip Fundamental Desain UI dengan FIGMA untuk Desainer UI/UX',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff06284F),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFAB400),
                                                  size: 11,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  '4.9',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff194476),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/people_with_rectangle.png',
                                                  width: 12,
                                                  height: 12,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Text(
                                                  '890',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff194476),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              'Rp. 89.000',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff06284F),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              'Rp. 299.000',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffE34D46),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: kCanvasColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: Get.width,
        height: 60,
        child: Obx(() => Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0;
                            i <
                                (
                                    // _rcC.isChecking.value == "true" &&
                                    //       Platform.isIOS
                                    //   ? 1
                                    //   :
                                    _newNavbarPrakerja.length);
                            i++)
                          InkWell(
                            onTap: () async {
                              _prakerjaHc.ecommSelected.value = i;
                            },
                            child: Container(
                              padding: i == 0 && Platform.isAndroid
                                  //  &&
                                  //         (_rcC.isChecking.value == "false" &&
                                  //             Platform.isIOS)
                                  ? const EdgeInsets.only(left: 50, top: 9)
                                  : i == 2
                                      ? const EdgeInsets.only(right: 50, top: 9)
                                      : null,
                              margin: i == 1
                                  ? const EdgeInsets.only(top: 17)
                                  : null,
                              width: Get.size.width * 0.33,
                              child: Column(
                                children: [
                                  Image.asset(
                                    _prakerjaHc.ecommSelected.value == i
                                        ? _newNavbarPrakerja[i]['icon_select']
                                        : _newNavbarPrakerja[i]
                                            ['icon_deselect']!,
                                    width: 22,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(_newNavbarPrakerja[i]['text'],
                                      style: TextStyle(
                                        fontSize: 9,
                                        color:
                                            _prakerjaHc.ecommSelected.value == i
                                                ? const Color(0xff1C1D20)
                                                : const Color(0xff939598),
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Positioned.fill(
                      top: -15,
                      child: GestureDetector(
                        onTap: () => _prakerjaHc.ecommSelected.value = 1,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: ClipOval(
                              child: Container(
                                width: 53,
                                height: 53,
                                color: const Color(0xffFF8017),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Image.asset(
                                    'assets/images/kelas_saya_icon.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
                Platform.isIOS
                    ? SizedBox(height: Get.size.height * 0.02)
                    : const SizedBox()
              ],
            )),
      ),
    );
  }
}
