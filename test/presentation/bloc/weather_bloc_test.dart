import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:razorerp_weather_app/core/utils/location_service.dart';
import 'package:razorerp_weather_app/domain/usecases/get_weather_forecast.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_bloc.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_state.dart';

@GenerateMocks([GetWeatherForecast, LocationService])
import 'weather_bloc_test.mocks.dart';

class MockStorage extends Mock implements Storage {}

void initHydratedStorage() {
  HydratedBloc.storage = MockStorage();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  late MockGetWeatherForecast mockGetWeatherForecast;
  late MockLocationService mockLocationService;

  setUp(() {
    mockGetWeatherForecast = MockGetWeatherForecast();
    mockLocationService = MockLocationService();
    initHydratedStorage();
  });

  group('WeatherBloc', () {
    test('initial state is WeatherInitial', () {
      final weatherBloc = WeatherBloc(
        getWeatherForecast: mockGetWeatherForecast,
        locationService: mockLocationService,
      );
      expect(weatherBloc.state, isA<WeatherInitial>());
      weatherBloc.close();
    });
  });
}