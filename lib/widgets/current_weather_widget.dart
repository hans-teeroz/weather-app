import 'package:flutter/material.dart';

import 'package:wearther_app/models/weather_data_current.dart';
import 'package:wearther_app/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [tempeatureAreaWidget(), currentWeatherMoreDetailsWidget()],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Container();
  }

  Widget tempeatureAreaWidget() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
              "assets/weather/${weatherDataCurrent.weather.weather![0].icon}.png",
              height: 80,
              width: 80),
          Container(
            height: 50,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "${weatherDataCurrent.weather.main!.temp!.toInt()}°",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: CustomColors.textColorBlack)),
            TextSpan(
                text: "${weatherDataCurrent.weather.weather![0].description}°",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey))
          ]))
        ],
      ),
    );
  }
}
