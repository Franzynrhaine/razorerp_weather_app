import 'package:equatable/equatable.dart';
import 'package:razorerp_weather_app/domain/entities/weather_forecast.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap();
  
  static WeatherState fromMap(Map<String, dynamic> map) {
    final String type = map['type'] as String;
    switch (type) {
      case 'initial':
        return WeatherInitial();
      case 'loading':
        return WeatherLoading();
      case 'loaded':
        return WeatherLoaded(
          forecast: WeatherForecast.fromJson(map['forecast'] as Map<String, dynamic>),
        );
      case 'error':
        return WeatherError(message: map['message'] as String);
      default:
        return WeatherInitial();
    }
  }
}

class WeatherInitial extends WeatherState {
  @override
  Map<String, dynamic> toMap() => {'type': 'initial'};
}

class WeatherLoading extends WeatherState {
  @override
  Map<String, dynamic> toMap() => {'type': 'loading'};
}

class WeatherLoaded extends WeatherState {
  final WeatherForecast forecast;

  const WeatherLoaded({required this.forecast});

  @override
  List<Object> get props => [forecast];

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': 'loaded',
      'forecast': forecast,
    };
  }
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object> get props => [message];

  @override
  Map<String, dynamic> toMap() => {
    'type': 'error',
    'message': message,
  };
}