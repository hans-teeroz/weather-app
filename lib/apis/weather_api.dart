import 'dart:convert';

import 'package:wearther_app/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:wearther_app/models/weather_data_current.dart';
import 'package:wearther_app/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData?> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    print(jsonString);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData;
  }
}
