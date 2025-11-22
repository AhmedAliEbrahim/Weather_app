import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(weatherapp());
}

class weatherapp extends StatelessWidget {
  weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
           builder: (context, state) {
         return MaterialApp(
              theme: ThemeData(
                  primaryColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,)
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ) ;
          },
        ),
      ),
    );
  }

}

MaterialColor getThemeColor( String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
    switch (condition) {
    // Clear/Sunny conditions
      case "Sunny":
      case 'clear':
        return Colors.orange;

    // Partly cloudy
      case 'partly cloudy':
        return Colors.blue;

    // Cloudy conditions
      case 'cloudy':
      case 'overcast':
        return Colors.blueGrey;

    // Mist and Fog
      case 'mist':
      case 'fog':
      case 'freezing fog':
        return Colors.grey;

    // Rain conditions
      case 'patchy rain possible':
      case 'patchy light rain':
      case 'light rain':
      case 'light rain shower':
        return Colors.lightBlue;

      case 'moderate rain at times':
      case 'moderate rain':
      case 'moderate or heavy rain shower':
        return Colors.blue;

      case 'heavy rain at times':
      case 'heavy rain':
      case 'torrential rain shower':
        return Colors.indigo;

    // Drizzle
      case 'patchy light drizzle':
      case 'light drizzle':
        return Colors.cyan;

      case 'patchy freezing drizzle possible':
      case 'freezing drizzle':
      case 'heavy freezing drizzle':
        return Colors.teal;

    // Freezing rain
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
        return Colors.deepPurple;

    // Snow conditions
      case 'patchy snow possible':
      case 'patchy light snow':
      case 'light snow':
      case 'light snow showers':
        return Colors.lightBlue;

      case 'patchy moderate snow':
      case 'moderate snow':
        return Colors.blue;

      case 'patchy heavy snow':
      case 'heavy snow':
      case 'moderate or heavy snow showers':
        return Colors.indigo;

      case 'blowing snow':
      case 'blizzard':
        return Colors.deepPurple;

    // Sleet
      case 'patchy sleet possible':
      case 'light sleet':
      case 'light sleet showers':
        return Colors.cyan;

      case 'moderate or heavy sleet':
      case 'moderate or heavy sleet showers':
        return Colors.teal;

    // Ice pellets
      case 'ice pellets':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.purple;

    // Thunder
      case 'thundery outbreaks possible':
      case 'patchy light rain with thunder':
        return Colors.deepOrange;

      case 'moderate or heavy rain with thunder':
        return Colors.red;

      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.pink;

    // Default fallback
      default:
        return Colors.grey;
    }
  }