import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      Response response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=a0359126d1dc4b81ba6184516251701&days=1&q=$cityName');

      Map<String, dynamic> json = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(json);

      return weatherModel;
    } on DioException catch (e) {
      String responseMessage = e.response?.data['error']['message'] ??
          'oops,there was an error ,please try later.';
      throw Exception(responseMessage);
    } catch (e) {
      throw Exception('oops,there was an error ,please try later.');
    }
  }
}
