import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: getMaterialColor(
                    // BlocProvider.of<WeatherCubit>(context)
                    //     .weatherModel?.condition),
                    'Sunny'),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  color: getMaterialColor(BlocProvider.of<WeatherCubit>(context)
                      .weatherModel
                      ?.condition),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.teal;
    case "Mist":
      return Colors.lightGreen;
    default:
      return Colors.blue;
  }
}
