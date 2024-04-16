import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/home_screen.dart';
import 'package:state_management_practice/weather_practice/bloc/weather_bloc.dart';
import 'package:state_management_practice/weather_practice/data/data_provider/weather_data_provider.dart';
import 'package:state_management_practice/weather_practice/data/respository/weather_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => WeatherRepository(WeatherDataProvider()),
        child: BlocProvider(
          create: (context) => WeatherBloc(
            context.read<WeatherRepository>(),
          ),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ));
  }
}
