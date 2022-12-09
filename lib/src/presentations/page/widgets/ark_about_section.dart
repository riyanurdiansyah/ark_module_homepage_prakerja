import 'package:ark_module_homepage_prakerja/src/presentations/page/widgets/ark_check_box_with_text.dart';
import 'package:ark_module_homepage_prakerja/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPrakerjaSection extends StatelessWidget {
  final bool isRevampPrakerja;

  AboutPrakerjaSection({Key? key, this.isRevampPrakerja = false})
      : super(key: key);

  final List<String> _syaratMendaftar = [
    'WNI berusia 18 tahun keatas.',
    'Tidak sedang menempuh pendidikan formal.',
    'Sedang mencari kerja, pekerja/buruh yang terkena PHK, atau pekerja/buruh yang membutuhkan peningkatan kompetensi kerja, seperti pekerja/buruh yang dirumahkan dan pekerja bukan penerima upah, termasuk pelaku usaha mikro & kecil.',
    'Bukan penerima bantuan sosial lainnya selama pandemi COVID-19.',
    'Bukan Pejabat Negara, Pimpinan dan Anggota DPRD, ASN, Prajurit TNI, Anggota Polri, Kepala Desa dan perangkat desa dan Direksi/Komisaris/Dewan Pengawas pada BUMN atau BUMD.',
    'Maksimal 2 NIK dalam 1 KK yang menjadi Penerima Kartu Prakerja.',
  ];
  @override
  Widget build(BuildContext context) {
    return isRevampPrakerja == true
        ? Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              Row(
                children: [
                  const Text(
                    'Tentang',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  SvgPicture.asset(
                    'assets/images/logo_kartu_prakerja.svg',
                    height: 35,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Image.asset(
                  'assets/images/icon-prakerja1.png',
                  height: 161,
                  width: 195,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Program Kartu Prakerja adalah program pengembangan kompetensi kerja dan kewirausahaan yang ditujukan untuk pencari kerja, pekerja/buruh yang terkena pemutusan hubungan kerja, dan/atau pekerja/buruh yang membutuhkan peningkatan kompetensi, termasuk pelaku usaha mikro dan kecil.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  fontFamily: 'SourceSansPro',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 11),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      color: const Color(0xff69A7E9),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/prakerja_icon.svg',
                          height: 14,
                          width: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  const Expanded(
                    child: Text(
                      'Program Kartu Prakerja merupakan program ramah difabel. Difabel dianjurkan untuk mendaftar dan mengikuti Program Kartu Prakerja.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'SourceSansPro',
                        color: Colors.white,
                        height: 1.4,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              //Syarat mendaftar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Syarat Mendaftar',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff06284F),
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (int i = 0; i < _syaratMendaftar.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.check_circle,
                                size: 17,
                                color: Color(0xff4A91DC),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(
                              _syaratMendaftar[i],
                              style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  height: 1.5,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff194476)),
                            ))
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () => launchUrl(
                          Uri.parse(
                            'https://www.prakerja.go.id/',
                          ),
                          mode: LaunchMode.externalApplication,
                          webViewConfiguration: const WebViewConfiguration(
                            enableJavaScript: true,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFF8017),
                              borderRadius: BorderRadius.circular(4.91)),
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Text(
                  'Tentang Kartu Prakerja',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset(
                    'assets/images/icon-prakerja1.png',
                    height: 188,
                    width: 231,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Program Kartu Prakerja adalah program pengembangan kompetensi kerja dan kewirausahaan yang ditujukan untuk pencari kerja, pekerja/buruh yang terkena pemutusan hubungan kerja, dan/atau pekerja/buruh yang membutuhkan peningkatan kompetensi, termasuk pelaku usaha mikro dan kecil.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                      fontSize: 14.5,
                      fontFamily: 'SourceSansPro'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon-prakerja2.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Program Kartu Prakerja merupakan program ramah difabel. Difabel dianjurkan untuk mendaftar dan mengikuti Program Kartu Prakerja.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'SourceSansPro',
                            color: kNewBlack3,
                            height: 1.4,
                            fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                //Syarat mendaftar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Syarat Mendaftar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    for (int i = 0; i < _syaratMendaftar.length; i++)
                      CheckboxWithText(_syaratMendaftar[i]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () => launchUrl(
                          Uri.parse('https://www.prakerja.go.id/'),
                          // forceWebView: true, enableJavaScript: true,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                kPrimaryGradient1,
                                kPrimaryGradient2
                              ]),
                              borderRadius: BorderRadius.circular(4.91)),
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
