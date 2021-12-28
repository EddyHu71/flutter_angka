import 'package:flutter_angka/domain/calculation/calculation_failure.dart';
import 'package:flutter_angka/domain/core/failure.dart';
import 'package:flutter_angka/domain/core/failure.dart';
import 'package:fpdart/fpdart.dart';

Either<ValueFailure<String>, String> validateNumber(String input) {
  if (input == "0") {
    return left(ValueFailure.nolValue(failedValue: input));
  } else if (input.toString().isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}
