import 'package:flutter_angka/domain/calculation/calculation_failure.dart';
import 'package:flutter_angka/domain/calculation/i_calculation.dart';
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

@LazySingleton(as: ICalculation)
class CalculationRepo extends ICalculation {
  @override
  Future<Either<CalculationFailed, List<String>>> calculate(
      double number, String types) async {
    // TODO: implement calculate
    try {
      List<String> listNumber = <String>[];
      if (number == 0) {
        return left(const CalculationFailed.nolValue());
      } else {
        print("Types " + types);
        if (types == "1") {
          for (var i = 1; i <= number; i++) {
            listNumber.add(i.toString());
          }
        } else if (types == "2") {
          var bil = 0;
          for (var i = 1; i < (number * 2); i++) {
            if (i > number) {
              bil--;
              listNumber.add(bil.toString());
            } else {
              bil++;
              listNumber.add(bil.toString());
            }
          }
        } else if (types == "3") {
          var bilangan = 10;
          for (var i = 1; i <= number; i++) {
            listNumber.add(bilangan.toString());
            bilangan += 11;
          }
        } else {
          for (var i = 1; i <= number; i++) {
            if (i % 5 == 0) {
              listNumber.add("LIMA");
            } else if (i % 7 == 0) {
              listNumber.add("TUJUH");
            } else {
              listNumber.add(i.toString());
            }
          }
        }
        return right(listNumber);
      }
    } catch (e) {
      print("Calculate Failed");
      print(e);
      return left(const CalculationFailed.failed());
    }
  }
}
