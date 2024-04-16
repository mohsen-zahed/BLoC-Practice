import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management_practice/weather_practice/data/respository/weather_repository.dart';
import 'package:state_management_practice/weather_practice/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeatherDataRequested>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    FetchWeatherDataRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      print('before');
      final weather = await weatherRepository.getCurrentWeatherData();
      print('after');
      emit(WeatherSuccess(weather));
    } catch (e) {
      print('error');
      emit(WeatherFailure(e.toString()));
    }
  }
}
