import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('47d454a97cac4822b7eb0400cf416bc9');
  Weather? _weather;

  //featch weather
  _featchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    //any errors
    catch (e) {
      print(e);
    }
  }

  //weather anumations
  //init state
  @override
  void initState() {
    super.initState();
    //fetched weather
    _featchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(_weather?.cityName ?? "loading city .. "),
      //  Text('${double.tryParse(_weather!.temperature)?.round() ?? 0}°C')

     ]),)
    );
  }
}
