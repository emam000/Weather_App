import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/widgets/today_container.dart';
import 'package:weather_app/widgets/weather_data_widget.dart';

class GetWeatherCard extends StatelessWidget {
  const GetWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.read<WeatherCubit>().getBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              TodayContainer(),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          WeatherDataWidget(),
        ],
      ),
    );
  }
}
