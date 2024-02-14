import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<WeatherCubit>(context).getWeather(value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              hintText: 'Enter city name to search.',
              label: Text('City Name'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 8.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
