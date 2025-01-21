import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/weather_states.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<SuperState> {
  GetWeatherCubit():super(NoWeatherState());

  getWeather({required String cityName})async {
    try {
      var weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityName);
      emit(
        WeatherLoadedState(weatherModel: weatherModel),
      );
    } catch (e) {
      emit(
        WeatherFailuerState(),
      );
    }
  }
}
