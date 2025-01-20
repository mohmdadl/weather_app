class WeatherModel {
  String cityName;
  String date;
  String weatherState;
  String? weatherStateLogo;
  double maxTemp;
  double minTemp;
  double temp;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.weatherState,
    required this.weatherStateLogo,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: json["location"]["localtime"],
      weatherState: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      weatherStateLogo: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["icon"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
    );
  }
}
