part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class GetWeatherDataSuccess extends WeatherState {
  final List<WeatherModel> weathers;

  GetWeatherDataSuccess({required this.weathers});
}

class GetWeatherDataError extends WeatherState {
  final String error;

  GetWeatherDataError({required this.error});
}

class ChangeValue extends WeatherState {}
