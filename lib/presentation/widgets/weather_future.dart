import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorerp_weather_app/domain/entities/weather.dart';
import 'package:razorerp_weather_app/presentation/widgets/weather_current.dart';
import '../../domain/entities/weather_forecast.dart';


class VerticalWeatherForecastList extends StatelessWidget {
  final List<Weather> weatherList;
  final String title;

  const VerticalWeatherForecastList({super.key, required this.weatherList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: weatherList.length,
            itemBuilder: (context, index) {
              final weather = weatherList[index];
              return WeatherDayItem(weather: weather, isHorizontal: false);
            },
          ),
        ),
      ],
    );
  }
}

class WeatherDayItem extends StatelessWidget {
  final Weather weather;
  final bool isHorizontal;

  const WeatherDayItem({super.key, required this.weather, required this.isHorizontal});

  @override
  Widget build(BuildContext context) {
    return _buildVerticalItem();
  }

  Widget _buildVerticalItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              DateFormat('EEEE').format(DateTime.parse(weather.date)),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 34, 34, 34)),
            ),
          ),
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
                imageUrl: 'http://openweathermap.org/img/w/${weather.icon}.png',
                width: 64,
                height: 64,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            
          ),
          Expanded(
            flex: 2,
            child: Text(
              weather.description.split(' ').map((word) => toBeginningOfSentenceCase(word)).join(' '),
              style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 107, 107, 107)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${weather.temp.round()}°',
              style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 107, 107, 107)),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}