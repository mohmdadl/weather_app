import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,elevation: 0,
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
            decoration: InputDecoration(
              label: const Text('search'),
              hintText: 'Enter City Name',
              contentPadding: const EdgeInsets.all(20),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Weather();
                      },
                    ),
                  );
                },
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
