import 'package:weather_app/models/weather_model.dart';

class SuperState {}

class WeatherLoadedState extends SuperState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class NoWeatherState extends SuperState {}

class WeatherFailuerState extends SuperState {}
