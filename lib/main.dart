import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/getWeatherCubit/weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

import 'common/get_weather_color.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:
          BlocBuilder<GetWeatherCubit, SuperState>(builder: (context, state) {
        final weatherCondition =
            context.watch<GetWeatherCubit>().weatherModel?.weatherState;
        return MaterialApp(
          theme: ThemeData(
            
            colorScheme: ColorScheme.fromSeed(
              seedColor: getWeatherColor(weatherCondition),
              dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
            ),
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
