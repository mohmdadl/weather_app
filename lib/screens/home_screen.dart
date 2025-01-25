import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/getWeatherCubit/weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Weather',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              // color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, SuperState>(builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Weather();
        } else if (state is NoWeatherState) {
          return const NoWeather();
        } else {
          return const Center(child: Text('oops,there was an error!'));
        }
      }),
    );
  }
}
