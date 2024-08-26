import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBloc.storage = storage;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => di.sl<WeatherBloc>(),
        child: WeatherPage(),
      ),
    );
  }
}