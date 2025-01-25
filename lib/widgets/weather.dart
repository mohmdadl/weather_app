import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import '../common/themes.dart';
import '../common/get_weather_color.dart';

class Weather extends StatelessWidget {
  Weather({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weatherModel.weatherState),
            getWeatherColor(weatherModel.weatherState)[300]!,
            getWeatherColor(weatherModel.weatherState)[50]!,
           ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Column(
              children: [
                Text(
                  weatherModel.cityName,
                  style: cityStyle,
                ),
                Text(
                  weatherModel.date,
                  style: normalStyle,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weatherModel.weatherStateLogo}" ??
                      'https://dummyimage.com/200x150/cccccc/000000&text=No+Image',
                  width: MediaQuery.of(context).size.width * 0.22,
                ),
                Text(weatherModel.temp.toString(), style: cityStyle),
                Column(
                  children: [
                    Text(
                      weatherModel.maxTemp.toString(),
                    ),
                    Text(
                      weatherModel.minTemp.toString(),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(weatherModel.weatherState, style: cityStyle),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
