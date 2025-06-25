import 'package:flutter/material.dart';

class ErrorWeatherCard extends StatelessWidget {
  final String error;
  const ErrorWeatherCard({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Image(
              image: AssetImage("assets/error.jpg"),
            ),
            Text(
              textAlign: TextAlign.center,
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
