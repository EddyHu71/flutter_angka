import 'package:flutter_angka/presentation/calculation/view_calculate.dart';
import 'package:get/get.dart';

class Routes {
  static const String calculation = "/calculation";
  final List<GetPage> routes = [
    GetPage(name: Routes.calculation, page: () => Calculation())
  ];
}
