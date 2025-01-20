import 'package:flutter/material.dart';
import '../common/themes.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        shadowColor: Colors.blue,
      ),
      body: Container(
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
                    'Dammita',
                    style: cityStyle,
                  ),
                  Text(
                    'update at:01:45',
                    style: normalStyle,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                // mainAxisSize: MainAxisSize.min,

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://dummyimage.com/200x150/cccccc/000000&text=No+Image',
                    width: MediaQuery.of(context).size.width * 0.22,
                  ),
                  Text('17', style: cityStyle),
                  const Column(
                    children: [
                      Text('Max Temp:23'),
                      Text('Min Temp:10'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text('Light Rain', style: cityStyle),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
