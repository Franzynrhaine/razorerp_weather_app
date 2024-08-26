// Mocks generated by Mockito 5.4.4 from annotations
// in razorerp_weather_app/test/presentation/bloc/weather_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i3;
import 'package:geolocator/geolocator.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:razorerp_weather_app/core/errors/failures.dart' as _i8;
import 'package:razorerp_weather_app/core/utils/location_service.dart' as _i10;
import 'package:razorerp_weather_app/domain/entities/weather_forecast.dart'
    as _i9;
import 'package:razorerp_weather_app/domain/repositories/weather_repository.dart'
    as _i2;
import 'package:razorerp_weather_app/domain/usecases/get_weather_forecast.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherRepository_0 extends _i1.SmartFake
    implements _i2.WeatherRepository {
  _FakeWeatherRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePosition_2 extends _i1.SmartFake implements _i4.Position {
  _FakePosition_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetWeatherForecast].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWeatherForecast extends _i1.Mock
    implements _i5.GetWeatherForecast {
  MockGetWeatherForecast() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WeatherRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeWeatherRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.WeatherRepository);

  @override
  String get apiKey => (super.noSuchMethod(
        Invocation.getter(#apiKey),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#apiKey),
        ),
      ) as String);

  @override
  _i7.Future<_i3.Either<_i8.Failure, _i9.WeatherForecast>> execute(
    double? lat,
    double? lon,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            lat,
            lon,
          ],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, _i9.WeatherForecast>>.value(
                _FakeEither_1<_i8.Failure, _i9.WeatherForecast>(
          this,
          Invocation.method(
            #execute,
            [
              lat,
              lon,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, _i9.WeatherForecast>>);
}

/// A class which mocks [LocationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationService extends _i1.Mock implements _i10.LocationService {
  MockLocationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i4.Position> getCurrentLocation() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentLocation,
          [],
        ),
        returnValue: _i7.Future<_i4.Position>.value(_FakePosition_2(
          this,
          Invocation.method(
            #getCurrentLocation,
            [],
          ),
        )),
      ) as _i7.Future<_i4.Position>);
}
