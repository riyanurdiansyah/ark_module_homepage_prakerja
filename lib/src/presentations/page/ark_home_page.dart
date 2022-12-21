import 'dart:developer';

import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/presentations/page/widgets/ark_slider_banner.dart';
import 'package:ark_module_homepage_prakerja/utils/app_empty_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ArkHomePagePrakerja extends StatelessWidget {
  ArkHomePagePrakerja({Key? key}) : super(key: key);

  final _prakerjaHC = Get.put(ArkHomePagePrakerjaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
        child: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () => Get.toNamed('/main'),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Colors.white,
                )),
            actions: [
              Container(
                margin: const EdgeInsets.only(
                  top: 4,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/prakerja-search-page');
                    // _dC.firstInit.value = true;
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo-arkademi-white.png',
                    height: 25, fit: BoxFit.fill),
                const SizedBox(
                  width: 18,
                ),
                SvgPicture.asset(
                  'assets/images/logo_kartu_prakerja.svg',
                  height: 28,
                  color: Colors.white,
                ),
              ],
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4A91DC),
                    Color(0xFF0977BE),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.1,
              ),
              child: const ArkPrakerjaBanner(
                isWebinar: true,
              ),
            )),
      ),
      body: Obx(
        () => _prakerjaHC.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //  BANNER
                    if (_prakerjaHC.sliderImage.value != emptySlider)
                      ArkPrakerjaSliderFromBackend(controller: _prakerjaHC),

                    if (_prakerjaHC.sliderImage.value != emptySlider)
                      const SizedBox(
                        height: 30,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Beli di Marketplace Pilihanmu',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff06284F),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          // MARKET PLACE LOGO
                          Wrap(
                            children: List.generate(
                              marketPlaceWebinar.length,
                              (i) => Obx(
                                () => GestureDetector(
                                  onTap: () async {
                                    _prakerjaHC.ecommSelected.value = i;
                                    switch (i) {
                                      case 0:
                                        {
                                          if (_prakerjaHC
                                              .tokopediaList.isEmpty) {
                                            _prakerjaHC.fetchOneEcom(
                                                marketPlaceWebinar[i]['title']);
                                          }
                                          _prakerjaHC.listHomeEcome.value =
                                              _prakerjaHC.tokopediaList;
                                        }
                                        break;
                                      case 1:
                                        {
                                          if (_prakerjaHC
                                              .bukalapakList.isEmpty) {
                                            _prakerjaHC.fetchOneEcom(
                                                marketPlaceWebinar[i]['title']);
                                          }
                                          _prakerjaHC.listHomeEcome.value =
                                              _prakerjaHC.bukalapakList;
                                        }
                                        break;

                                      case 2:
                                        {
                                          if (_prakerjaHC
                                              .sekolahmuList.isEmpty) {
                                            _prakerjaHC.fetchOneEcom(
                                                marketPlaceWebinar[i]['title']);
                                          }
                                          _prakerjaHC.listHomeEcome.value =
                                              _prakerjaHC.sekolahmuList;
                                        }
                                        break;
                                      case 4:
                                        {
                                          if (_prakerjaHC
                                              .pijarMahirList.isEmpty) {
                                            _prakerjaHC.fetchOneEcom(
                                                marketPlaceWebinar[i]['title']);
                                          }
                                          _prakerjaHC.listHomeEcome.value =
                                              _prakerjaHC.pijarMahirList;
                                        }
                                        break;
                                    }
                                  },
                                  child: Container(
                                    width: 105,
                                    margin: EdgeInsets.only(
                                        right:
                                            i == marketPlaceWebinar.length - 1
                                                ? 0
                                                : 7,
                                        bottom: 7),
                                    padding: EdgeInsets.symmetric(
                                      vertical: marketPlaceWebinar[i]
                                                  ['title'] ==
                                              'pijarmahir'
                                          ? 7.6
                                          : 11,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color:
                                              _prakerjaHC.ecommSelected.value ==
                                                      i
                                                  ? const Color(0xff5291DB)
                                                  : kNewBlack4),
                                    ),
                                    child: Image.asset(
                                      '${marketPlaceWebinar[i]['icon']}',
                                      height: marketPlaceWebinar[i]['title'] ==
                                              'pijarmahir'
                                          ? 20
                                          : 13,
                                      fit: BoxFit.fitHeight,
                                      opacity: _prakerjaHC
                                                  .ecommSelected.value ==
                                              i
                                          ? null
                                          : const AlwaysStoppedAnimation(.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // FOR CARD MIDDLE
                    // ListView.builder(
                    //               padding: const EdgeInsets.symmetric(horizontal: 16),
                    //               itemCount: _pHC.allEcomNewClasses.length,
                    //               scrollDirection: Axis.horizontal,
                    //               itemBuilder: (context, i) {
                    //                 return CardClassSquare(i);
                    //               },
                    //             ),
                    Obx(
                      () => _prakerjaHC.isLoadingEcom.value == true
                          ? const SizedBox(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          // BELI DI MARKET PLACE
                          : SizedBox(
                              height: 290,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: _prakerjaHC.listHomeEcome.isEmpty
                                    ? _prakerjaHC.mainEcomNewClassess.length
                                    : _prakerjaHC.listHomeEcome.length,
                                itemBuilder: (context, index) {
                                  final tglMulai =
                                      _prakerjaHC.listHomeEcome.isEmpty
                                          ? _prakerjaHC
                                                  .mainEcomNewClassess[index]
                                                  .tanggalMulai ??
                                              0 * 1000
                                          : _prakerjaHC.listHomeEcome[index]
                                                  .tanggalMulai ??
                                              0 * 1000;
                                  final tglSelesai =
                                      _prakerjaHC.listHomeEcome.isEmpty
                                          ? _prakerjaHC
                                                  .mainEcomNewClassess[index]
                                                  .tanggalSelesai ??
                                              0 * 1000
                                          : _prakerjaHC.listHomeEcome[index]
                                                  .tanggalSelesai ??
                                              0 * 1000;
                                  return InkWell(
                                    onTap: () => Get.toNamed('/class-prakerja',
                                        arguments: _prakerjaHC
                                            .mainEcomNewClassess[index].id),
                                    child: SizedBox(
                                      width: 270,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        elevation: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 270,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(7),
                                                  topRight: Radius.circular(7),
                                                ),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      _prakerjaHC
                                                          .mainEcomNewClassess[
                                                              index]
                                                          .image!,
                                                    ),
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 19),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (tglMulai != 0 &&
                                                      tglSelesai != 0)
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 11,
                                                        vertical: 3,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: const Color(
                                                            0xff234061),
                                                      ),
                                                      child: Text(
                                                        "${DateFormat.MMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglMulai))} - ${DateFormat.yMMMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglSelesai))}",
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    _prakerjaHC
                                                        .mainEcomNewClassess[
                                                            index]
                                                        .title!,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xff06284F),
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    height: 14,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Color(
                                                                0xffFAB400),
                                                            size: 11,
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          if (_prakerjaHC
                                                                  .mainEcomNewClassess[
                                                                      index]
                                                                  .rating! !=
                                                              '')
                                                            Text(
                                                              double.parse(_prakerjaHC
                                                                          .mainEcomNewClassess[
                                                                              index]
                                                                          .rating!) <
                                                                      3.0
                                                                  ? '5.0'
                                                                  : _prakerjaHC
                                                                      .mainEcomNewClassess[
                                                                          index]
                                                                      .rating!,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xff194476),
                                                                fontFamily:
                                                                    'SourceSansPro',
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
                                                            '${(int.parse(_prakerjaHC.mainEcomNewClassess[index].siswa!) < 5) ? 5 : _prakerjaHC.mainEcomNewClassess[index].siswa!} siswa',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff194476),
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 14,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        currencyFormatter
                                                            .format(
                                                          int.parse(_prakerjaHC
                                                              .mainEcomNewClassess[
                                                                  index]
                                                              .price!),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              Color(0xff06284F),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      _prakerjaHC
                                                                  .mainEcomNewClassess[
                                                                      index]
                                                                  .sale ==
                                                              ''
                                                          ? const SizedBox()
                                                          : Text(
                                                              currencyFormatter
                                                                  .format(
                                                                int.parse(_prakerjaHC
                                                                    .mainEcomNewClassess[
                                                                        index]
                                                                    .sale!),
                                                              ),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xffE34D46),
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: 225,
                              child: ButtonReusableWidgets(
                                paddingOutline: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 13,
                                  ),
                                ),
                                borderSide: MaterialStateProperty.all(
                                  const BorderSide(
                                    color: Color(0xff4A91DC),
                                    width: 0.8,
                                  ),
                                ),
                                shapeOutline: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                isOutlinedButton: true,
                                onPressed: () {
                                  log("CEK : ${_prakerjaHC.ecommSelected.value}");
                                  _prakerjaHC.indexBeliDiMarketPlace.value = 0;
                                  Get.toNamed(
                                    '/beli-di-market-place-webinar',
                                    arguments: _prakerjaHC.ecommSelected.value,
                                  );
                                },
                                title: 'Lihat Semua Pelatihan',
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2476CC),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 51,
                          ),
                          const Text(
                            'Pelatihan Terpopuler',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff06284F),
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          // PELATIHAN TERPOPULER
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount:
                                _prakerjaHC.pelatihanTerpopuler.length > 4
                                    ? 4
                                    : _prakerjaHC.pelatihanTerpopuler.length,
                            itemBuilder: (context, index) {
                              final tglSelesaiPopuler = _prakerjaHC
                                      .pelatihanTerpopuler[index]
                                      .tanggalSelesai ??
                                  0;

                              final tglMulaiPopuler = _prakerjaHC
                                      .pelatihanTerpopuler[index]
                                      .tanggalMulai ??
                                  0;
                              return InkWell(
                                onTap: () => Get.toNamed('/class-prakerja',
                                    arguments: _prakerjaHC
                                        .mainEcomNewClassess[index].id),
                                child: Card(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 3,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          bottomLeft: Radius.circular(6),
                                        ),
                                        child: Image.network(
                                          _prakerjaHC.pelatihanTerpopuler[index]
                                              .image!,
                                          width: 97,
                                          height: 147,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 22, bottom: 14, top: 14),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (tglMulaiPopuler != 0 &&
                                                  tglSelesaiPopuler != 0)
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 11,
                                                    vertical: 3,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color:
                                                        const Color(0xff234061),
                                                  ),
                                                  child: Text(
                                                    // TODO CHANGE DATE OF WEBINAR
                                                    "${DateFormat.MMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglMulaiPopuler))} - ${DateFormat.yMMMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglSelesaiPopuler))}",
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              const SizedBox(
                                                height: 9,
                                              ),
                                              Text(
                                                _prakerjaHC
                                                    .pelatihanTerpopuler[index]
                                                    .title!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff06284F),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 9,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xffFAB400),
                                                        size: 11,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        double.parse(_prakerjaHC
                                                                    .pelatihanTerpopuler[
                                                                        index]
                                                                    .rating!) <
                                                                3.0
                                                            ? '5.0'
                                                            : _prakerjaHC
                                                                .pelatihanTerpopuler[
                                                                    index]
                                                                .rating!,
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff194476),
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
                                                        int.parse(_prakerjaHC
                                                                    .pelatihanTerpopuler[
                                                                        index]
                                                                    .siswa!) <
                                                                5
                                                            ? '5'
                                                            : _prakerjaHC
                                                                .pelatihanTerpopuler[
                                                                    index]
                                                                .siswa!,
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff194476),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      const Text(
                                                        'siswa',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff194476),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    currencyFormatter.format(
                                                        int.parse(_prakerjaHC
                                                            .pelatihanTerpopuler[
                                                                index]
                                                            .price!)),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Color(0xff06284F),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 9,
                                                  ),
                                                  _prakerjaHC
                                                              .pelatihanTerpopuler[
                                                                  index]
                                                              .sale ==
                                                          ''
                                                      ? const SizedBox()
                                                      : Text(
                                                          currencyFormatter
                                                              .format(int.parse(
                                                                  _prakerjaHC
                                                                      .pelatihanTerpopuler[
                                                                          index]
                                                                      .sale!)),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xffE34D46),
                                                            decoration:
                                                                TextDecoration
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
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Rangkaian Kegiatan\nPelatihan Prakerja',
                            style: TextStyle(
                              color: Color(0xff06284F),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cardRangkaian.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final data = cardRangkaian[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 24,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xffB5B8BE),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      child: Image.asset(
                                        data['img']!,
                                        width: 29,
                                        height: 29,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['title']!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff06284F),
                                              fontFamily: 'SourceSansPro',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data['subTitle']!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff194476),
                                              fontFamily: 'SourceSansPro',
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 47,
                        horizontal: 36,
                      ),
                      color: const Color(0xffF7F8FB),
                      child: Column(
                        children: [
                          const Text(
                            'Cara Mengikuti Pelatihan Prakerja di Arkademi',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff06284F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // FOR CARA MENGIKUTI PELATIHAN
                          const CaraMengikutiPelatihan(),
                          const SizedBox(
                            height: 47,
                          ),
                          const Text(
                            'Cara Menyelesaikan Pelatihan Prakerja di Arkademi',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff06284F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // FOR CARA MENYELESAIKAN PELATIHAN
                          Stack(
                            children: [
                              Positioned(
                                left: 15,
                                top: 30,
                                bottom: 39,
                                child: CustomPaint(
                                  size: const Size(1, 100),
                                  painter: DashedLineVerticalPainter(),
                                ),
                              ),
                              ListView.builder(
                                itemCount: stepPenyelesaian.length,
                                physics: const ScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 36,
                                          height: 36,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                stepPenyelesaian[index]['img']!,
                                                width: 32,
                                                height: 32,
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xff3784D6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3,
                                                    horizontal: 5,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${index + 1}',
                                                      style: const TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            stepPenyelesaian[index]['title']!,
                                            style: const TextStyle(
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff194476),
                                              fontFamily: 'SourceSansPro',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff68A6E9),
                            Color(0xff4A91DC),
                            Color(0xff3884D4),
                            Color(0xff418AD8),
                            Color(0xff68A6E9),
                          ],
                        ),
                      ),
                      child: AboutPrakerjaSection(
                        isRevampPrakerja: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
