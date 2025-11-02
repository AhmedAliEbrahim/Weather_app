import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/info_weather.dart';
import 'package:weather_app/widgets/no_weather.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text("Weather app",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchScreen();
            }));
          },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is NoWeatherState){
            return NoWeather();
          }
          if( state is WeatherLoadedState){
            return InfoWeather();
          }
          else {
            return Text("opps there was an error");
          }
        },
      )
      );

  }
}
