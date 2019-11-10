import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }
    void getLocationData()async{
    var weatherData = await WeatherModel().getLocationData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }
    ));
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SpinKitDoubleBounce(
          color: Colors.tealAccent,
          size: 100.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
      ),
    ),
      ),
    );
  }
}
