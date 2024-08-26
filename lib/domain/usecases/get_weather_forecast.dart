import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failures.dart';
import '../entities/weather_forecast.dart';
import '../repositories/weather_repository.dart';

class GetWeatherForecast {
  final WeatherRepository repository;
  final String apiKey;

  GetWeatherForecast({required this.repository, required this.apiKey});

  Future<Either<Failure, WeatherForecast>> execute(double lat, double lon) {
    return repository.getWeatherForecast(lat, lon, apiKey);
  }
}

class Params extends Equatable {
  final double lat;
  final double lon;

  const Params({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}