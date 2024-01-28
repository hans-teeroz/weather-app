import 'package:wearther_app/models/weather/item.dart';

import './weather/clouds.dart';
import './weather/coord.dart';
import './weather/main.dart';
import './weather/sys.dart';
import './weather/wind.dart';
import './weather/weather.dart';

class WeatherDataCurrent {
  final Weather weather;
  WeatherDataCurrent({required this.weather});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(weather: Weather.fromJson(json));
}

class Weather {
  Coord? coord;
  List<Item>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, dynamic>),
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        base: json['base'] as String?,
        visibility: json['visibility'] as int?,
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        dt: json['dt'] as int?,
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
        timezone: json['timezone'] as int?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        cod: json['cod'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
        'coord': coord?.toJson(),
        'base': base,
        'main': main?.toJson(),
        'visibility': visibility,
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
        'dt': dt,
        'sys': sys?.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };
}
