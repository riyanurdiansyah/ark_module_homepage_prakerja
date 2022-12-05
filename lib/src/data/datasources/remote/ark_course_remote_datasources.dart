import 'package:ark_module_homepage_prakerja/src/domain/entities/ark_ecom_prakerja_m.dart';

abstract class ArkCourseRemoteDatasources {
  Future<HomeOneEcom> fetchOneEcom(String ecom);
}
