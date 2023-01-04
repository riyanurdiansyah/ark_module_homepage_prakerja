import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:ark_module_homepage_prakerja/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ArkPelatihanTerpopuler extends StatelessWidget {
  const ArkPelatihanTerpopuler({
    Key? key,
    required ArkHomePagePrakerjaController prakerjaHC,
  })  : _prakerjaHC = prakerjaHC,
        super(key: key);

  final ArkHomePagePrakerjaController _prakerjaHC;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: _prakerjaHC.pelatihanTerpopuler.length > 4
          ? 4
          : _prakerjaHC.pelatihanTerpopuler.length,
      itemBuilder: (context, index) {
        final tglSelesaiPopuler =
            _prakerjaHC.pelatihanTerpopuler[index].tanggalSelesai ?? 0;

        final tglMulaiPopuler =
            _prakerjaHC.pelatihanTerpopuler[index].tanggalMulai ?? 0;
        return InkWell(
          onTap: () => Get.toNamed('/class-prakerja',
              arguments: _prakerjaHC.pelatihanTerpopuler[index].id),
          child: Card(
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
                    _prakerjaHC.pelatihanTerpopuler[index].image!,
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
                    padding:
                        const EdgeInsets.only(right: 22, bottom: 14, top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (tglMulaiPopuler != 0 && tglSelesaiPopuler != 0)
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
                              // TODO CHANGE DATE OF WEBINAR
                              "${DateFormat.MMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglMulaiPopuler))} - ${DateFormat.yMMMMd('id').format(DateTime.fromMillisecondsSinceEpoch(tglSelesaiPopuler))}",
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          _prakerjaHC.pelatihanTerpopuler[index].title!,
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
                                  color: Color(0xffFAB400),
                                  size: 11,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  double.parse(_prakerjaHC
                                              .pelatihanTerpopuler[index]
                                              .rating!) <
                                          3.0
                                      ? '5.0'
                                      : _prakerjaHC
                                          .pelatihanTerpopuler[index].rating!,
                                  style: const TextStyle(
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
                                Text(
                                  // int.parse(_prakerjaHC
                                  //             .pelatihanTerpopuler[
                                  //                 index]
                                  //             .siswa!) <
                                  //         5
                                  //     ? '5'
                                  //     : _prakerjaHC
                                  //         .pelatihanTerpopuler[
                                  //             index]
                                  //         .siswa!,

                                  //  CHANGING BY REQUEST
                                  '${_prakerjaHC.pelatihanTerpopuler[index].siswa!.parseInt().getSiswa()} siswa',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff194476),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                // const Text(
                                //   'siswa',
                                //   style: TextStyle(
                                //     fontSize: 10,
                                //     fontWeight:
                                //         FontWeight.w500,
                                //     color:
                                //         Color(0xff194476),
                                //   ),
                                // ),
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
                              currencyFormatter.format(int.parse(_prakerjaHC
                                  .pelatihanTerpopuler[index].price!)),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff06284F),
                              ),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            _prakerjaHC.pelatihanTerpopuler[index].sale == ''
                                ? const SizedBox()
                                : Text(
                                    currencyFormatter.format(int.parse(
                                        _prakerjaHC
                                            .pelatihanTerpopuler[index].sale!)),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffE34D46),
                                      decoration: TextDecoration.lineThrough,
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
    );
  }
}
