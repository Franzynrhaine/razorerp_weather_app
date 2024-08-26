import 'package:razorerp_weather_app/domain/entities/weather.dart';
import 'package:razorerp_weather_app/domain/entities/weather_forecast.dart';

class WeatherForecastModel extends WeatherForecast {
  const WeatherForecastModel({required super.list});

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    var weatherList = json['list'] as List;
    List<Weather> weatherObjects = weatherList.map((weatherJson) => Weather.fromJson(weatherJson)).toList();
    
    return WeatherForecastModel(list: weatherObjects);
  }
}