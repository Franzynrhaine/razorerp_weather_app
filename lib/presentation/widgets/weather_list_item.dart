import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorerp_weather_app/domain/entities/weather_forecast.dart';
import '../../domain/entities/weather.dart';

class WeatherForecastScreen extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherForecastScreen({super.key, required this.weatherList, required WeatherForecast forecast});

  @override
  Widget build(BuildContext context) {
    final currentWeather = weatherList.first;
    final now = DateTime.now();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _getBackgroundGradient(currentWeather.description),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEEE').format(now),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('MMMM d').format(now),
                      style: const TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${currentWeather.temp.round()}°',
                      style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      currentWeather.description,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
              WeatherForecastList(weatherList: weatherList),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getBackgroundGradient(String weatherDescription) {
    if (weatherDescription.contains('clear')) {
      return [Colors.blue, Colors.lightBlue];
    } else if (weatherDescription.contains('cloud')) {
      return [Colors.grey, Colors.blueGrey];
    } else if (weatherDescription.contains('rain')) {
      return [Colors.indigo, Colors.blueGrey];
    } else if (weatherDescription.contains('snow')) {
      return [Colors.lightBlue, Colors.white];
    } else {
      return [Colors.blue, Colors.lightBlue];
    }
  }
}

class WeatherForecastList extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherForecastList({Key? key, required this.weatherList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
        itemBuilder: (context, index) {
          final weather = weatherList[index];
          return WeatherDayItem(weather: weather);
        },
      ),
    );
  }
}

class WeatherDayItem extends StatelessWidget {
  final Weather weather;

  const WeatherDayItem({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('E').format(DateTime.parse(weather.date)),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 34, 34, 34)),
          ),
          Text(
            DateFormat('hh:mm a').format(DateTime.parse(weather.date)),
            style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 34, 34, 34)),
          ),
          const SizedBox(height: 8),
          Image.network(
            'http://openweathermap.org/img/w/${weather.icon}.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.temp.round()}°',
            style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 107, 107, 107)),
          ),
          const SizedBox(height: 4),
          Text(
            weather.description.split(' ').map((word) => toBeginningOfSentenceCase(word)).join(' '),
            style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 107, 107, 107)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}