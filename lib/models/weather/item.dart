class Item {
  int? id;
  String? main;
  String? description;
  String? icon;

  Item({this.id, this.main, this.description, this.icon});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
