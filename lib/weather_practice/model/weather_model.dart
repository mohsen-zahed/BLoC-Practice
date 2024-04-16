class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      currentTemp: map['currentTemp'] as double,
      currentSky: map['currentSky'] as String,
      currentPressure: map['currentPressure'] as double,
      currentWindSpeed: map['currentWindSpeed'] as double,
      currentHumidity: map['currentHumidity'] as double,
    );
  }
}
