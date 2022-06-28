import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String url =
    'https://api.openweathermap.org/data/2.5/weather?q=Milan&units=metric&appid=0d5cc78bf00333878f4a8ddbe730f608';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;

  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location location = Location();
    await location.getlocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url);

    var weather = networkHelper.getdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
      ),
    );
  }
}
