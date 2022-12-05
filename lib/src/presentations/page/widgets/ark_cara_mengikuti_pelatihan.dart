import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';
import 'package:flutter/material.dart';

class CaraMengikutiPelatihan extends StatelessWidget {
  const CaraMengikutiPelatihan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
          child: CustomPaint(
            size: const Size(1, 300),
            painter: DashedLineVerticalPainter(),
          ),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/smartphone.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                const Expanded(
                  child: Text(
                    'Beli di digital platform untuk mendapatkan kode voucher dan redeem prakerja',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff194476),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/signup.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Expanded(
                    child: Text(
                      'Buat akun Arkademi',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff194476),
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/typing.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff194476),
                        fontFamily: 'SourceSansPro',
                      ),
                      children: [
                        TextSpan(text: 'Klik '),
                        TextSpan(
                          text: '"Tukar Voucher"',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff194476),
                          ),
                        ),
                        TextSpan(text: ' untuk menukarkan voucher prakerjamu'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/schedule.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const Expanded(
                    child: Text(
                      'Pilih satu sesi yang ingin kamu ikuti',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff194476),
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/mobile_pay.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff194476),
                        fontFamily: 'SourceSansPro',
                      ),
                      children: [
                        TextSpan(text: 'Klik '),
                        TextSpan(
                          text: '"Ikuti Pelatihan"',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff194476),
                          ),
                        ),
                        TextSpan(
                            text:
                                ' dan masukkan kode redeem yang sudah didapatkan'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/webinar_prakerja/information.png',
                        width: 32,
                        height: 32,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff3784D6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: const Center(
                            child: Text(
                              '6',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
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
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff194476),
                        fontFamily: 'SourceSansPro',
                      ),
                      children: [
                        TextSpan(text: 'Klik '),
                        TextSpan(
                          text: '"Masuk Pelatihan"',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff194476),
                          ),
                        ),
                        TextSpan(text: ' untuk mulai belajar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
