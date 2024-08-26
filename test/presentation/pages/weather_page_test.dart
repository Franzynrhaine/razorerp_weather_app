import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_bloc.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_state.dart';
import 'package:razorerp_weather_app/presentation/pages/weather_page.dart';

@GenerateMocks([WeatherBloc])
import 'weather_page_test.mocks.dart';

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
  });

  testWidgets('WeatherPage shows initial state message', (WidgetTester tester) async {
    when(mockWeatherBloc.state).thenReturn(WeatherInitial());
    when(mockWeatherBloc.stream).thenAnswer((_) => Stream.value(WeatherInitial()));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>.value(
          value: mockWeatherBloc,
          child: const WeatherPage(),
        ),
      ),
    );
    
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}