import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../entities/weather_forecast.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherForecast>> getWeatherForecast(double lat, double lon, String apiKey) async {
    try {
      final remoteWeatherForecast = await remoteDataSource.getWeatherForecast(lat, lon, apiKey);
      return Right(remoteWeatherForecast as WeatherForecast);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}