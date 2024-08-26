import '../models/weather_forecast_model.dart';
import '../../core/api/api_client.dart';
import '../../core/errors/exceptions.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherForecastModel> getWeatherForecast(double lat, double lon, String apiKey);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherForecastModel> getWeatherForecast(double lat, double lon, String apiKey) async {
  final response = await client.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': apiKey,
        'units': 'metric',
      },
    );

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}