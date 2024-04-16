import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/weather_practice/bloc/weather_bloc.dart';
import 'package:state_management_practice/weather_practice/data/data_provider/weather_data_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherDataProvider weatherDataProvider = WeatherDataProvider();
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeatherDataRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherFailure) {
            return Center(child: Text(state.error));
          }
          if (state is! WeatherSuccess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Text(state.weatherModel.currentTemp.toString()),
              Text(state.weatherModel.currentSky),
              Text(state.weatherModel.currentHumidity.toString()),
            ],
          );
        },
      ),
    );
  }
}
