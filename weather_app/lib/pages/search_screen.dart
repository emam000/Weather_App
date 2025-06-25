import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> searchKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 200,
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: searchKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Color(0xff1db5ed),
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorStyle: TextStyle(color: Colors.orange),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter Country Or City",
                      labelStyle:
                          TextStyle(color: Color(0xff1db5ed), fontSize: 20),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      prefixIconColor: Color(0xff1db5ed),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter The Country Name Or The City Name";
                      } else if (val.length < 3) {
                        return "The Country Name Must Be At Lest 6 Charachter";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (searchKey.currentState!.validate()) {
                      BlocProvider.of<WeatherCubit>(context)
                          .getWeatherData(controller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minWidth: 150,
                  height: 40,
                  color: Color(0xff1db5ed),
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
