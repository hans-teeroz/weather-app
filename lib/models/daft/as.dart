import 'weather.dart';

class As {
  List<Weather>? weather;

  As({this.weather});

  factory As.fromJson(Map<String, dynamic> json) => As(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
