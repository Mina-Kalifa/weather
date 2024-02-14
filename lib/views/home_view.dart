import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/body_text_widget.dart';
import 'package:weather_app/widgets/weather_display_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadedState) {
          return WeatherDisplay();
        } else if (state is WeatherInitialState) {
          return const BodyText(text: 'Welcome to Weather App');
        } else {
          return const BodyText(text: 'Enter a Valid City Name');
        }
      }),
    );
  }
}
