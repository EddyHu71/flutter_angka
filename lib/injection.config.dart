// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/calculation/get_calculation.dart' as _i5;
import 'domain/calculation/i_calculation.dart' as _i3;
import 'infrastructure/calculation/calculation_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ICalculation>(() => _i4.CalculationRepo());
  gh.factory<_i5.GetCalculation>(
      () => _i5.GetCalculation(get<_i3.ICalculation>()));
  return get;
}
