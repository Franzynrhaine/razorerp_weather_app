import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:razorerp_weather_app/core/errors/failures.dart';
import 'package:razorerp_weather_app/core/utils/location_service.dart';
import 'package:razorerp_weather_app/domain/usecases/get_weather_forecast.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  final GetWeatherForecast getWeatherForecast;
  final LocationService locationService;

  WeatherBloc({
    required this.getWeatherForecast,
    required this.locationService,
  }) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final position = await locationService.getCurrentLocation();
      final result = await getWeatherForecast.execute(position.latitude, position.longitude);
      result.fold(
        (failure) => emit(WeatherError(message: _mapFailureToMessage(failure))),
        (forecast) => emit(WeatherLoaded(forecast: forecast)),
      );
    } catch (e) {
      emit(const WeatherError(message: 'Unexpected error occurred'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Server error';
      case CacheFailure _:
        return 'Cache error';
      default:
        return 'Unexpected error';
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return WeatherInitial();
    try {
      return WeatherState.fromMap(json);
    } catch (_) {
      return WeatherInitial();
    }
  }

 @override
  Map<String, dynamic>? toJson(WeatherState state) {
    try {
      return state.toMap();
    } catch (_) {
      return null;
    }
  }
}