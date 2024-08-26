import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_model.g.dart';

abstract class WeatherModel implements Built<WeatherModel, WeatherModelBuilder> {
  int get dt;
  BuiltList<WeatherDescriptionModel> get weather;
  int get visibility;
  double get pop;
  String get dt_txt;

  WeatherModel._();
  factory WeatherModel([void Function(WeatherModelBuilder) updates]) = _$WeatherModel;

  static Serializer<WeatherModel> get serializer => _$weatherModelSerializer;
}

abstract class WeatherDescriptionModel implements Built<WeatherDescriptionModel, WeatherDescriptionModelBuilder> {
  int get id;
  String get main;
  String get description;
  String get icon;

  WeatherDescriptionModel._();
  factory WeatherDescriptionModel([void Function(WeatherDescriptionModelBuilder) updates]) = _$WeatherDescriptionModel;

  static Serializer<WeatherDescriptionModel> get serializer => _$weatherDescriptionModelSerializer;
}