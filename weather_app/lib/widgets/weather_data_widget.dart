import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class WeatherDataWidget extends StatelessWidget {
  const WeatherDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: context.read<WeatherCubit>().weathersModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  DateFormat('EEEE').format(DateTime.parse(
                      context.read<WeatherCubit>().weathersModel[index].date)),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<WeatherCubit>().changeValue(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: context.read<WeatherCubit>().myindex == index
                          ? Colors.white
                          : Colors.white38,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              "http:${context.read<WeatherCubit>().weathersModel[index].weatherStateIcon}"),
                          width: 70,
                          height: 70,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "${context.read<WeatherCubit>().weathersModel[index].avgtemp}°C",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
