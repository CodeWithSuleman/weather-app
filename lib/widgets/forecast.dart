import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constant_colors.dart';

class ForeCastCard extends StatelessWidget {
  ForeCastCard(
      {super.key,
      required this.averageTemp,
      required this.description,
      required this.descriptionIMG,
      required this.hour});
  String hour;
  String description;
  String descriptionIMG;
  double averageTemp;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(18, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hour,
            style: TextStyle(
                color: Color(ConstantColors.whiteColor),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Container(
            height: 70,
            width: 70,
            color: Color(ConstantColors.blackColor),
            child: Image.network(descriptionIMG, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            "$averageTemp°",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(ConstantColors.whiteColor)),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(139, 255, 255, 255),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
