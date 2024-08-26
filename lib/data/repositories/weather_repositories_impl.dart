import 'package:dartz/dartz.dart';
import 'package:razorerp_weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:razorerp_weather_app/domain/repositories/weather_repository.dart';
import 'package:razorerp_weather_app/core/errors/failures.dart';
import 'package:razorerp_weather_app/domain/entities/weather_forecast.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherForecast>> getWeatherForecast(double lat, double lon, String apiKey) async {
    try {
      final remoteWeather = await remoteDataSource.getWeatherForecast(lat, lon, apiKey);
      return Right(remoteWeather);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}