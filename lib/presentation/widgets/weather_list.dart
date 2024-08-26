import 'package:flutter/material.dart';
import 'package:razorerp_weather_app/domain/entities/weather.dart';
import 'package:razorerp_weather_app/presentation/widgets/weather_current.dart';
import 'package:razorerp_weather_app/presentation/widgets/weather_future.dart';
import '../../domain/entities/weather_forecast.dart';
import 'weather_list_item.dart';

class WeatherForecastScreen extends StatelessWidget {
  final WeatherForecast forecast;

  const WeatherForecastScreen({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final currentWeather = forecast.list.first;
    final nextFiveDaysForecast = _getNextFiveDaysForecast(forecast.list);
    final todayForecast = _getTodayForecast(forecast.list);

    return Column(
      children: [
        CurrentWeatherWidget(currentWeather: currentWeather),
        const SizedBox(height: 20),
        WeatherForecastList(weatherList: todayForecast),
        VerticalWeatherForecastList(weatherList: nextFiveDaysForecast, title: '5 day forecast',)
      ],
    );
  }

  List<Weather> _getNextFiveDaysForecast(List<Weather> fullForecast) {
    final now = DateTime.now();
    final currentDate = DateTime(now.year, now.month, now.day);
    final Map<DateTime, Weather> dailyForecasts = {};

    for (var weather in fullForecast) {
      final forecastDate = DateTime.parse(weather.date);
      final forecastDay = DateTime(forecastDate.year, forecastDate.month, forecastDate.day);
      
      if (forecastDay.isAfter(currentDate) && dailyForecasts.length < 5) {
        if (!dailyForecasts.containsKey(forecastDay)) {
          dailyForecasts[forecastDay] = weather;
        }
      }
    }
    final sortedForecasts = dailyForecasts.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sortedForecasts.map((e) => e.value).toList();
  }

  List<Weather> _getTodayForecast(List<Weather> fullForecast) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return fullForecast.where((weather) {
      final weatherDate = DateTime.parse(weather.date);
      return weatherDate.year == today.year &&
             weatherDate.month == today.month &&
             weatherDate.day == today.day;
    }).toList();
  }

}