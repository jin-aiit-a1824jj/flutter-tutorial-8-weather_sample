import 'package:flutter/material.dart';
import 'package:weathersampel/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodeData = jsonDecode(data);

      var longitude = decodeData['coord']['lon'];
      print(longitude);

      var weatherDescription = decodeData['weather'][0]['description'];
      print(weatherDescription);

      var temperature = decodeData['main']['temp'];
      print(temperature);

      var condition = decodeData['weather'][0]['id'];
      print(condition);

      var cityName = decodeData['name'];
      print(cityName);

    } else {
      print(response.statusCode);
    }
  }
}
