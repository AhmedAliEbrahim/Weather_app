

import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  final Dio dio;

  WeatherService( this.dio);

  Future<WeatherModel> getCurrentWeather({ required String cityName}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/forecast.json?key=3b4a431894c74935b16201136250408&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    }
   on DioException catch(e){
      final String errorMassage = e.response?.data["error"]["message"]??"oops there was an error , try later";
      throw Exception(errorMassage);
    }
    catch(e){
      log(e.toString());
      throw Exception("try later");
    }
  }


}