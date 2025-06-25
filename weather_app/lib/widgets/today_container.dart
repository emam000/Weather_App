import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class TodayContainer extends StatelessWidget {
  const TodayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Column(
            children: [
              Image(
                image: NetworkImage(
                    "http:${context.read<WeatherCubit>().weathersModel[context.read<WeatherCubit>().myindex].weatherStateIcon}"),
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),
              Text(
                context
                    .read<WeatherCubit>()
                    .weathersModel[context.read<WeatherCubit>().myindex]
                    .cityname,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${context.read<WeatherCubit>().weathersModel[context.read<WeatherCubit>().myindex].avgtemp}°C",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEEE').format(DateTime.parse(context
                    .read<WeatherCubit>()
                    .weathersModel[context.read<WeatherCubit>().myindex]
                    .date)),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context
                    .read<WeatherCubit>()
                    .weathersModel[context.read<WeatherCubit>().myindex]
                    .date,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
