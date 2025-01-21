import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Search City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            // color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (cityName) {
              GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: cityName);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              label: Text('search'),
              hintText: 'Enter City Name',
              contentPadding: EdgeInsets.all(20),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
