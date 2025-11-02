import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class InfoWeather extends StatelessWidget {
  const InfoWeather({super.key});

  @override
  Widget build(BuildContext context) {
     var weatherModel =  BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'updated at ${weatherModel.date}',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    "https:${weatherModel.image}",

                  ),
                  const SizedBox(width: 20),
                  Text(
                    '${weatherModel.temp.round()}°',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxTemp.round()}°',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mintemp: ${weatherModel.minTemp.round()}°',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                weatherModel.weatherCondition,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
