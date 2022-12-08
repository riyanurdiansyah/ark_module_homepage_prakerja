import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/src/presentations/page/controller/ark_home_pake_controller.dart';
import 'package:ark_module_homepage_prakerja/src/presentations/page/widgets/ark_slider_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkHomePagePrakerja extends StatelessWidget {
  ArkHomePagePrakerja({Key? key}) : super(key: key);

  final _prakerjaHC = Get.put(ArkHomePagePrakerjaController());
  // final _dC = Get.put(DirectoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
        child: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                // onPressed: () => Get.offNamed(AppRouteName.main),
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
                    // _dC.firstInit.value = true;
                    // Get.to(() => PrakerjaSearchPage());
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
                    ArkPrakerjaSliderFromBackend(controller: _prakerjaHC),

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
                            height: 19,
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
                                          _prakerjaHC.mainList.value =
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
                                          _prakerjaHC.mainList.value =
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
                                          _prakerjaHC.mainList.value =
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
                                          _prakerjaHC.mainList.value =
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
                      height: 18,
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
                          : SizedBox(
                              height: 290,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _prakerjaHC.mainEcomNewClasses.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 270,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      elevation: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 110,
                                            width: 270,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                topRight: Radius.circular(7),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 19),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                                  child: const Text(
                                                    '28 Nov - 3 Des 2022',
                                                    style: TextStyle(
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
                                                const Text(
                                                  'Menerapkan Prinsip Fundamental Desain UI dengan FIGMA untuk Desainer UI/UX',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
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
                                                      children: const [
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                              Color(0xffFAB400),
                                                          size: 11,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          '4.9',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                        const Text(
                                                          '890 siswa',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  children: const [
                                                    Text(
                                                      'Rp. 89.000',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color:
                                                            Color(0xff06284F),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      'Rp. 299.000',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffE34D46),
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
                                onPressed: () {},
                                // onPressed: () => Get.toNamed(
                                //     AppRouteName.beliDiMarketPlaceWebinar,
                                //     arguments: _prakerjaHC.ecommSelected.value),
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
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.only(bottom: 15),
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
                                              height: 9,
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
                                              height: 9,
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
                                                    const Text(
                                                      '890',
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
