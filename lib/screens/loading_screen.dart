import 'package:flutter/material.dart';
import 'package:weathersampel/services/location.dart';
import 'package:weathersampel/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    this.latitude = location.latitude;
    this.longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${this.latitude}&lon=${this.longitude}&appid=$apiKey');

    var decodeData = await networkHelper.getData();

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
  }

  double latitude;
  double longitude;
}

const apiKey = 'apikey';
