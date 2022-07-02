import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    WeatherModel object = WeatherModel();
    var weather = await object.getlocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weather);
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
