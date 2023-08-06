import 'package:flutter/material.dart';

class Informationscard extends StatelessWidget {
  Informationscard(
      {super.key,
      required this.humidity,
      required this.uvIndex,
      required this.wind});
  int humidity;
  double wind;
  double uvIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 100,
          height: 150,
          color: const Color.fromARGB(18, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  color: Color.fromARGB(30, 255, 255, 255),
                ))),
                width: 110,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('', height: 40, width: 40, fit: BoxFit.cover),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
