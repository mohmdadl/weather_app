import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                );
              },
      child: const Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Text(
            'THERE IS NO WEATHER 🙁 \nSTART SEARCHING NOW! 🔍',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
