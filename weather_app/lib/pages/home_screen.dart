import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/widgets/error_weather_card.dart';
import 'package:weather_app/widgets/get_weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Weather App"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 8,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is GetWeatherDataSuccess || state is ChangeValue) {
            return GetWeatherCard();
          } else if (state is GetWeatherDataError) {
            return ErrorWeatherCard(error: state.error);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
