import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import '../common/themes.dart';

class Weather extends StatelessWidget {
  WeatherModel weatherModel;
  Weather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Color(0xFFB2EBF2),
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
