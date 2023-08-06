import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather__api.dart';

class WeatherService {
  Future<Weather> getWeatherData() async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=f5783e1fee68d6228723ecc46804ee40");
    final respones = await http.get(uri);
    if (respones.statusCode == 200) {
      return Weather.fromJson(jsonDecode(respones.body));
    } else {
      throw Exception("Failed");
    }
  }
}

String city = 'Karachi';
