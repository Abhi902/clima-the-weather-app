import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcitylocation(String? cityname) async {
    var url =
        '$openweathermapurl?q=$cityname&appid=0d5cc78bf00333878f4a8ddbe730f608&units=metric';
    NetworkHelper object = await NetworkHelper(url);
    var weatherdata = object.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocation() async {
    Location location = Location();
    await location.getlocation();

    String url =
        '$openweathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=0d5cc78bf00333878f4a8ddbe730f608&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weather = await networkHelper.getdata();
    print(weather);
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
