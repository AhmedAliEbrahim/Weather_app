import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(weatherapp());
}

class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
