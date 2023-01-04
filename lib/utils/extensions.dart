import 'package:ark_module_homepage_prakerja/ark_module_homepage_prakerja.dart';

extension NumberToString on String {
  int parseInt() {
    return int.parse(this);
  }

  num parseNum() {
    return num.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension Siswa on int {
  String getSiswa() {
    if (this > 1000) {
      return '> 1.000';
    } else {
      var format = formatter.format(this);
      return format;
    }
  }
}
