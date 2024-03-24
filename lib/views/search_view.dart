import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFEAA40),
        title: const Text(
          'Search a City ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: const TextStyle(color: Color(0xffFEAA40)),
              hintText: 'Enter City Name',
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: const Icon(Icons.search),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffFEAA40),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
