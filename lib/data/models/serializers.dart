import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'weather_forecast_model.dart';
import 'weather_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  WeatherForecastModel,
  WeatherModel,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
    ).build();