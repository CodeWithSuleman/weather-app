import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/constant_colors.dart';
import 'package:weather_app/utils/icons.dart';

class Header extends StatefulWidget {
  Header(
      {super.key,
      required this.backgroundColor,
      required this.cityName,
      required this.temp,
      required this.description,
      required this.descriptionIMG,
      required this.stateName});
  String cityName;
  String stateName;
  double temp;
  String descriptionIMG;
  String description;
  Color backgroundColor;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  WeatherService weatherService = WeatherService();
  IconData textFieldClearIcon = Icons.clear;
  var _textFieldController = TextEditingController();
  bool _isloading = false;
  bool notFound = false;

  loadingFunc() async {
    await weatherService.getWeatherData();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height / 3,
      backgroundColor: widget.backgroundColor,
      title: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _isloading
                ? Lottie.network(rainyIcon, height: 50)
                : Container(
                    width: 700,
                    height: 50,
                    child: TextField(
                      controller: _textFieldController,
                      onSubmitted: (value) {
                        setState(() {
                          _isloading = true;
                          city = value;
                          Future.delayed(Duration(seconds: 1), () {
                            loadingFunc();
                            _textFieldController.clear;
                          });
                        });
                      },
                      style: TextStyle(color: Color(ConstantColors.whiteColor)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textFieldController.clear();
                              Focus.of(context).unfocus();
                            },
                            icon: Icon(textFieldClearIcon)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        hintText: 'Search For Cities',
                        helperStyle:
                            TextStyle(color: Color(ConstantColors.blackColor)),
                        filled: true,
                        fillColor: Color(ConstantColors.blackColor),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
            const SizedBox(height: 25),
            notFound
                ? Text("NOT FOUND")
                : Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.temp.toString() + '°',
                              style: const TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w200),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.cityName,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.stateName,
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.w200),
                              )),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Column(
                            children: [
                              Lottie.network(widget.descriptionIMG.toString(),
                                  fit: BoxFit.cover),
                              Text(
                                widget.description,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
