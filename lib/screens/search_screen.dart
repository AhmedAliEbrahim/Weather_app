
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Search City",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getweathercubit= BlocProvider.of<GetWeatherCubit>(context);
                getweathercubit.getweather(value: value);
                 Navigator.pop(context);
              },

              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 12),
                label: Text("Search"),
                hint: Text("Enter City Name",
                style: TextStyle(
                  color: Colors.grey[300],
                ),
                ),
                suffix:Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
                )
              ),
            )
          ),
        ),
      ),
    );
  }
}

