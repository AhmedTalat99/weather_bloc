import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Weather', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
              },
              icon: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody();
          } else {
            return const Text('opps there was an error');
          }
        },
      ),
    );
  }
}
