import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/loading/loading_page.dart';
import 'package:weather_app/model/weather__api.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/utils/constant_colors.dart';
import 'package:weather_app/utils/icons.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String image = '';
  Color defaultColor = '' as Color;
  int hour = 0;
  bool isday = false;
  bool isnight = false;
  String icon = '';
  bool _isloading = true;

  Future getWeather() async {
    weather = await WeatherService().getWeatherData();
    setState(() {
      getWeather();
      _isloading = false;
    });
  }

  void steDay() async {
    List datetime = weather.date.split('');
    var hours = datetime[1].split(':');
    var turnInt = int.parse(hours[0]);
    if (turnInt >= 19 || turnInt <= 5) {
      print(turnInt);
      setState(() {
        isnight = true;
        defaultColor = ConstantColors.blackColor as Color;
      });
    }
  }

  void day() async {
    setState(() {
      defaultColor = ConstantColors.primaryColor as Color;
    });
    if (weather.text == 'partly cloud') {
      setState(() {
        loadingIcon = partlyCloudDayIcon;
      });
      if (weather.text == 'sunny') {
        setState(() {
          loadingIcon = sunnyIcon;
        });
        if (weather.text == 'OverCast') {
          setState(() {
            loadingIcon = overcastDayIcon;
          });
        }
      }
    }
  }

  void night() async {
    setState(() {
      defaultColor = ConstantColors.blackColor as Color;
    });
    if (weather.text == 'Partly Cloud') {
      setState(() {
        loadingIcon = partlyCloudyIconNight;
      });
    }
    if (weather.text == 'clear') {
      setState(() {
        loadingIcon = clearNightIcon;
      });
    }
  }

  void getHour() async {
    List datetime = weather.date.split('');
    var hours = datetime[1].split(':');
    var turnInt = int.parse(hours[0]);
    setState(() {
      hour = turnInt;
    });
  }

  @override
  void initState() {
    getWeather();
    Timer.periodic(Duration(seconds: 2), (timer) {
      steDay();
    });
    Timer.periodic(Duration(seconds: 2), (timer) {
      isday ? day() : night();
    });
    Timer.periodic(Duration(seconds: 3), (timer) {
      getHour();
    });
    Future.delayed(Duration(seconds: 2), () async {
      WeatherService().getWeatherData();
      _isloading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _isloading ? LoadingPage() : Scaffold();
}
