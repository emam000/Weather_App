import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  List<WeatherModel> weathersModel = [];
  getWeatherData(String cityName) async {
    try {
      final response =
          await Dio().get("$weatherApi?key=$weatherApiKey&q=$cityName&days=3");

      List<WeatherModel> weathers = [
        WeatherModel.fromjson(response.data, 0),
        WeatherModel.fromjson(response.data, 1),
        WeatherModel.fromjson(response.data, 2),
        // WeatherModel.fromjson(response.data, 3),
        // WeatherModel.fromjson(response.data, 4),
        // WeatherModel.fromjson(response.data, 5),
        // WeatherModel.fromjson(response.data, 6),
        // WeatherModel.fromjson(response.data, 7),
        // WeatherModel.fromjson(response.data, 8),
        // WeatherModel.fromjson(response.data, 9),
      ];
      weathersModel = weathers;
      emit(GetWeatherDataSuccess(weathers: weathers));
    } on DioException catch (e) {
      final error =
          e.response!.data["error"]["message"] ?? "ooops Somthing went wrong";
      emit(GetWeatherDataError(error: error));
    } catch (e) {
      emit(GetWeatherDataError(error: "Try Again Later"));
    }
  }

  int myindex = 0;

  changeValue(int pindex) {
    myindex = pindex;

    emit(ChangeValue());
  }

  String getBackgroundImage() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "assets/morning.jpg";
    } else if (hour >= 12 && hour < 17) {
      return "assets/afternoon.jpg";
    } else {
      return "assets/evening.jpg";
    }
  }
}
