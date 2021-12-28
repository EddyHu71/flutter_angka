import 'package:freezed_annotation/freezed_annotation.dart';
part 'calculation_failure.freezed.dart';

@freezed
class CalculationFailed with _$CalculationFailed {
  const factory CalculationFailed.invalidNumber() = _InvalidNumber;
  const factory CalculationFailed.nolValue() = _NoValue;
  const factory CalculationFailed.failed() = _Failed;
}
