import 'package:get_it/get_it.dart';
import 'core/api/api_client.dart';
import 'core/utils/location_service.dart';
import 'data/datasources/weather_remote_datasource.dart';
import 'data/repositories/weather_repositories_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_weather_forecast.dart';
import 'presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  const String apiKey = '160ed07fbdb78adec0754a353e92b9b8';

  sl.registerFactory(() => WeatherBloc(
    getWeatherForecast: sl(),
    locationService: sl(),
  ));
  sl.registerLazySingleton(() => GetWeatherForecast(repository: sl(), apiKey: apiKey));
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => LocationService());
}