import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getWeatherCubit/get_weather_cubit.dart';

import '../main.dart';
import '../common/get_weather_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        FocusScope.of(context)
            .unfocus(); 
      }
    });
  }

 

  void _searchCity() {
    String cityName = _controller.text.trim();
    if (cityName.isNotEmpty) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: cityName);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherCondition =
        context.watch<GetWeatherCubit>().weatherModel?.weatherState;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onFieldSubmitted: (cityName) {
              FocusScope.of(context).unfocus();
              _searchCity();
            },
            decoration: InputDecoration(
              label: const Text('search'),
              hintText: 'Enter City Name',
              contentPadding: const EdgeInsets.all(20),
              suffixIcon: IconButton(
                onPressed: _searchCity,
                icon: const Icon(Icons.search),
                // color: getWeatherColor(weatherCondition)
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
