import 'dart:developer';
import 'dart:io';

import 'package:ark_module_homepage_prakerja/src/presentations/page/controller/ark_home_pake_controller.dart';
import 'package:ark_module_homepage_prakerja/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/constants.dart';

class ArkBeliDiMarketPlaceWebinar extends StatelessWidget {
  ArkBeliDiMarketPlaceWebinar({Key? key}) : super(key: key);
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
    // log(args.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
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
                                  _prakerjaHc.listHomeEcome.value =
                                      _prakerjaHc.tokopediaList;
                                }
                                break;
                              case 1:
                                {
                                  if (_prakerjaHc.bukalapakList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.listHomeEcome.value =
                                      _prakerjaHc.bukalapakList;
                                }
                                break;

                              case 2:
                                {
                                  if (_prakerjaHc.sekolahmuList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.listHomeEcome.value =
                                      _prakerjaHc.sekolahmuList;
                                }
                                break;
                              case 4:
                                {
                                  if (_prakerjaHc.pijarMahirList.isEmpty) {
                                    _prakerjaHc.fetchOneEcom(
                                        marketPlaceWebinar[i]['title']);
                                  }
                                  _prakerjaHc.listHomeEcome.value =
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
                    _prakerjaHc.listHomeEcome.isEmpty &&
                    _prakerjaHc.mainEcomNewClassess.isEmpty
                ? const Center(child: Text('Tidak ada kelas'))
                : _prakerjaHc.isLoadingEcom.value == true
                    ? ListView(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: List.generate(
                          4,
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
                        itemCount: _prakerjaHc.listHomeEcome.isEmpty
                            ? _prakerjaHc.mainEcomNewClassess.length
                            : _prakerjaHc.listHomeEcome.length,
                        itemBuilder: (context, i) {
                          final price = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc.mainEcomNewClassess[i].price!
                              : _prakerjaHc.listHomeEcome[i].price!;

                          final salePrice = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc.mainEcomNewClassess[i].sale ?? "0"
                              : _prakerjaHc.listHomeEcome[i].sale ?? "0";

                          final tglMulai = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc
                                      .mainEcomNewClassess[i].tanggalMulai ??
                                  0 * 1000
                              : _prakerjaHc.listHomeEcome[i].tanggalMulai ??
                                  0 * 1000;
                          final tglSelesai = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc
                                      .mainEcomNewClassess[i].tanggalSelesai ??
                                  0 * 1000
                              : _prakerjaHc.listHomeEcome[i].tanggalSelesai ??
                                  0 * 1000;

                          final title = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc.mainEcomNewClassess[i].title ??
                                  "..."
                              : _prakerjaHc.listHomeEcome[i].title ?? "...";

                          final id = _prakerjaHc.listHomeEcome.isEmpty
                              ? _prakerjaHc.mainEcomNewClassess[i].id ?? 0
                              : _prakerjaHc.listHomeEcome[i].id ?? 0;
                          return GestureDetector(
                            onTap: () {
                              log('beli di market place tapped');
                              Get.toNamed('/class-prakerja', arguments: id);
                            },
                            child: Card(
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
                                      _prakerjaHc.listHomeEcome.isEmpty
                                          ? _prakerjaHc.mainEcomNewClassess[i]
                                                  .image ??
                                              "..."
                                          : _prakerjaHc
                                                  .listHomeEcome[i].image ??
                                              "...",
                                      width: 97,
                                      height: 137,
                                      fit: BoxFit.fitHeight,
                                      errorBuilder: (_, __, ___) => Image.asset(
                                        'assets/images/arkademi-icon.png',
                                        color: Colors.blue,
                                      ),
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
                                          if (tglMulai != 0 && tglSelesai != 0)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 11,
                                                vertical: 3,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: const Color(0xff234061),
                                              ),
                                              child: Text(
                                                "${DateFormat.MMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglMulai))} - ${DateFormat.yMMMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglSelesai))}",
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            title,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
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
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xffFAB400),
                                                    size: 11,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    _prakerjaHc.listHomeEcome
                                                            .isEmpty
                                                        ? _prakerjaHc
                                                            .mainEcomNewClassess[
                                                                i]
                                                            .rating!
                                                        : _prakerjaHc
                                                            .listHomeEcome[i]
                                                            .rating!,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                  Text(
                                                    "${_prakerjaHc.listHomeEcome.isEmpty ? _prakerjaHc.mainEcomNewClassess[i].siswa!.parseInt().getSiswa() : _prakerjaHc.listHomeEcome[i].siswa!.parseInt().getSiswa()} Siswa",
                                                    //  CHANGING BY REQUEST
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                            children: [
                                              Text(
                                                salePrice == "" ||
                                                        salePrice == "0"
                                                    ? currencyFormatter.format(
                                                        int.parse(price))
                                                    : currencyFormatter.format(
                                                        int.parse(salePrice)),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xff06284F),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 9,
                                              ),
                                              if (salePrice != "" &&
                                                  salePrice != "0")
                                                Text(
                                                  currencyFormatter
                                                      .format(int.parse(price)),
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffE34D46),
                                                    decoration: TextDecoration
                                                        .lineThrough,
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
        height: Platform.isIOS ? 77 : 60,
        child: Obx(() => Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < (_newNavbarPrakerja.length); i++)
                          InkWell(
                            onTap: () {
                              _prakerjaHc.indexBeliDiMarketPlace.value = i;
                              if (i == 1) {
                                _prakerjaHc.indexBeliDiMarketPlace.value = 1;
                              }
                              if (i == 2) {
                                _prakerjaHc.indexBeliDiMarketPlace.value = 2;
                              }
                              Get.offAllNamed(
                                '/main-prakerja',
                                arguments: {
                                  'from': 'arkBeliDiMarketPlace',
                                  'page':
                                      _prakerjaHc.indexBeliDiMarketPlace.value,
                                },
                              );
                            },
                            child: Container(
                              padding: i == 0 && Platform.isAndroid
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
                                    _prakerjaHc.indexBeliDiMarketPlace.value ==
                                            i
                                        ? _newNavbarPrakerja[i]['icon_select']
                                        : _newNavbarPrakerja[i]
                                            ['icon_deselect']!,
                                    width: 22,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(_newNavbarPrakerja[i]['text'],
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: _prakerjaHc
                                                    .indexBeliDiMarketPlace
                                                    .value ==
                                                i
                                            ? const Color(0xff1C1D20)
                                            : const Color(0xff939598),
                                        fontWeight: FontWeight.w700,
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
                        onTap: () =>
                            _prakerjaHc.indexBeliDiMarketPlace.value = 1,
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
