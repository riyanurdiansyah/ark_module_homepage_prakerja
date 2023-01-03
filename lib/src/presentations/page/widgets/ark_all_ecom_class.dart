import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ArkAllEcomClass extends StatelessWidget {
  const ArkAllEcomClass({
    Key? key,
    required ArkHomePagePrakerjaController prakerjaHC,
  })  : _prakerjaHC = prakerjaHC,
        super(key: key);

  final ArkHomePagePrakerjaController _prakerjaHC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          final tglMulai = _prakerjaHC.listHomeEcome.isEmpty
              ? _prakerjaHC.mainEcomNewClassess[index].tanggalMulai ?? 0 * 1000
              : _prakerjaHC.listHomeEcome[index].tanggalMulai ?? 0 * 1000;
          final tglSelesai = _prakerjaHC.listHomeEcome.isEmpty
              ? _prakerjaHC.mainEcomNewClassess[index].tanggalSelesai ??
                  0 * 1000
              : _prakerjaHC.listHomeEcome[index].tanggalSelesai ?? 0 * 1000;
          return InkWell(
            onTap: () => Get.toNamed('/class-prakerja',
                arguments: _prakerjaHC.mainEcomNewClassess[index].id),
            child: SizedBox(
              width: 270,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 110,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              _prakerjaHC.mainEcomNewClassess[index].image!,
                            ),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (tglMulai != 0 && tglSelesai != 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 11,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
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
                            height: 15,
                          ),
                          Text(
                            _prakerjaHC.mainEcomNewClassess[index].title!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff06284F),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
                                    color: Color(0xffFAB400),
                                    size: 11,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  if (_prakerjaHC
                                          .mainEcomNewClassess[index].rating! !=
                                      '')
                                    Text(
                                      double.parse(_prakerjaHC
                                                  .mainEcomNewClassess[index]
                                                  .rating!) <
                                              3.0
                                          ? '5.0'
                                          : _prakerjaHC
                                              .mainEcomNewClassess[index]
                                              .rating!,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff194476),
                                        fontFamily: 'SourceSansPro',
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
                                    // '${(int.parse(_prakerjaHC.mainEcomNewClassess[index].siswa!) < 5) ? 5 : _prakerjaHC.mainEcomNewClassess[index].siswa!} siswa',
                                    //  CHANGING BY REQUEST
                                    '> 1.000 siswa',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff194476),
                                      fontFamily: 'SourceSansPro',
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                currencyFormatter.format(
                                  int.parse(_prakerjaHC
                                      .mainEcomNewClassess[index].price!),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff06284F),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              _prakerjaHC.mainEcomNewClassess[index].sale == ''
                                  ? const SizedBox()
                                  : Text(
                                      currencyFormatter.format(
                                        int.parse(_prakerjaHC
                                            .mainEcomNewClassess[index].sale!),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffE34D46),
                                        decoration: TextDecoration.lineThrough,
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
    );
  }
}
