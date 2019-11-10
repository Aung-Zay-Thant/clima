import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '07bcfac0f5b53d8756b8b7ee9b083e7b';
double latitude;
double logitude;
const url = 'https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {

  Future<dynamic> getCityWeather(var cityName)async{
    NetworkHelper networkHelper = NetworkHelper('$url?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = (location.latitude);
    logitude = (location.longitude);
    NetworkHelper networkHelper = NetworkHelper('$url?lat=$latitude&lon=$logitude&appid=$apiKey&units=metric');
  
    var weatherData = await networkHelper.getData();
    return weatherData;
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
