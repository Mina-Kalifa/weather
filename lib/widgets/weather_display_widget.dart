import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel!;
    var color = getMaterialColor(weatherData.condition);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color[50]!, color, color[200]!])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                weatherData.city,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 38.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Updated at ${weatherData.lastTime.day}',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Image.network('https:${weatherData.iconImage}')),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${weatherData.tempreture}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'H: ${weatherData.maxTempreture}',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'L: ${weatherData.minTempreture}',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              weatherData.condition,
              style: const TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
