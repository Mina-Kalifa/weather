import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather(String cityName) async {
    try {
      weatherModel = await WeatherService().getWeather(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailedState());
    }
  }
}
