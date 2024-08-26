import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double temp;
  final String description;
  final String icon;
  final String date;

  const Weather({
    required this.temp,
    required this.description,
    required this.icon,
    required this.date,
  });

  @override
  List<Object> get props => [temp, description, icon, date];

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      date: json['dt_txt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main': {'temp': temp},
      'weather': [{'description': description, 'icon': icon}],
      'dt_txt': date,
    };
  }
}