import 'package:flutter/foundation.dart';

class RocketModel {
  final String name;
  final String country;
  final String manufacturer;

  RocketModel({
    @required this.name,
    @required this.country,
    @required this.manufacturer,
  });

  RocketModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        country = json['country'],
        manufacturer = json['company'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'country': country,
        'manufacturer': manufacturer,
      };
}
