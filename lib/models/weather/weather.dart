import 'item.dart';

class Weather1 {
  List<Item>? weather;

  Weather1({this.weather});

  factory Weather1.fromJson(Map<String, dynamic> json) => Weather1(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
