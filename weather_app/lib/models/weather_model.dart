class WeatherModel {
  final String cityname;
  final String date;
  final num maxtemp;
  final num mintemp;
  final num avgtemp;
  final String weatherStateText;
  final String weatherStateIcon;

  WeatherModel({
    required this.cityname,
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.avgtemp,
    required this.weatherStateText,
    required this.weatherStateIcon,
  });

  factory WeatherModel.fromjson(json, int index) {
    return WeatherModel(
      cityname: json["location"]["name"],
      date: json["forecast"]["forecastday"][index]["date"],
      maxtemp: json["forecast"]["forecastday"][index]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][index]["day"]["mintemp_c"],
      avgtemp: json["forecast"]["forecastday"][index]["day"]["avgtemp_c"],
      weatherStateText: json["forecast"]["forecastday"][index]["day"]
          ["condition"]["text"],
      weatherStateIcon: json["forecast"]["forecastday"][index]["day"]
          ["condition"]["icon"],
    );
  }
}
