import 'dart:convert';

import 'package:state_management_practice/weather_practice/data/data_provider/weather_data_provider.dart';
import 'package:state_management_practice/weather_practice/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);
  Future<WeatherModel> getCurrentWeatherData() async {
    try {
      print('raw data requested');
      String resp = await weatherDataProvider.getRawWeatherData();
      print('raw data fetched');
      final data = jsonDecode(resp);
      print('raw data statusCode: ${data}');
      if (data['cod'] != 200) {
        throw 'Something went wrong!';
      }
      WeatherModel weather = WeatherModel.fromMap(data);
      return weather;
    } catch (e) {
      throw 'An unexpected error occured while fetching data!';
    }
  }
}
