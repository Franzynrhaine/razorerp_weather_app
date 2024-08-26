import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherForecast>> getWeatherForecast(double lat, double lon, String apiKey);
}