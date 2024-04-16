import 'package:dio/dio.dart';

class WeatherDataProvider {
  Future<String> getRawWeatherData() async {
    try {
      const apiKey = 'fa88c4230ebb702c6e7b5572e44a7095';
      const apiURL =
          'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=$apiKey';

      Dio dio = Dio();
      var response = await dio.get(apiURL, queryParameters: {'appid': apiKey});
      // print(response.runtimeType);
      return response.data.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
