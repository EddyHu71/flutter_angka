import 'package:flutter_angka/domain/core/failure.dart';
import 'package:flutter_angka/domain/core/value_objects.dart';
import 'package:flutter_angka/domain/core/value_validators.dart';
import 'package:fpdart/fpdart.dart';

class InputNumber extends ValueObject<String> {
  @override
  // TODO: implement value
  final Either<ValueFailure<String>, String> value;

  factory InputNumber(String input) {
    return InputNumber._(validateNumber(input));
  }

  const InputNumber._(this.value);
}
