import 'package:wearther_app/models/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  WeatherDataCurrent getCurrentWeather() => current!;
}
