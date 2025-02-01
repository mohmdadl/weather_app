import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<SuperState> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState()); 
      weatherModel = await WeatherService(dio: Dio()).getWeather(cityName);
      emit(
        WeatherLoadedState(),
      );
    } catch (e) {
      emit(
        WeatherFailuerState(),
      );
    }
  }
}
