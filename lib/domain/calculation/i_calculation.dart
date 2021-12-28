import 'package:flutter_angka/domain/calculation/calculation_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ICalculation {
  Future<Either<CalculationFailed, List<String>>> calculate(
      double number, String types);
}
