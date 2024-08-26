import 'package:equatable/equatable.dart';
import 'weather.dart';

class WeatherForecast extends Equatable {
  final List<Weather> list;

  const WeatherForecast({required this.list});

  @override
  List<Object> get props => [list];

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var weatherList = json['list'] as List;
    List<Weather> weatherObjects = weatherList.map((weatherJson) => Weather.fromJson(weatherJson)).toList();
    
    return WeatherForecast(list: weatherObjects);
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((weather) => weather.toJson()).toList(),
    };
  }
}