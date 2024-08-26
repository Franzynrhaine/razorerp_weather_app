import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_bloc.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_event.dart';
import 'package:razorerp_weather_app/presentation/bloc/weather_state.dart';
import 'package:razorerp_weather_app/presentation/widgets/weather_list.dart';
import 'package:razorerp_weather_app/presentation/widgets/error_view.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Whine Febre ERP Submission')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return _buildCenteredContent(const Text('Press the button to fetch weather'));
                    } else if (state is WeatherLoading) {
                      return _buildCenteredContent(const CircularProgressIndicator());
                    } else if (state is WeatherLoaded) {
                      return WeatherForecastScreen(forecast: state.forecast);
                    } else if (state is WeatherError) {
                      return ErrorView(message: state.message);
                    }
                    return Container();
                  },
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<WeatherBloc>().add(FetchWeather()),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildCenteredContent(Widget child) {
    return Container(
      alignment: Alignment.center,
      child: child,
    );
  }
}