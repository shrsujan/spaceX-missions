import 'package:flutter/foundation.dart';

class LaunchPadModel {
  final String name;

  LaunchPadModel({
    @required this.name,
  });

  LaunchPadModel.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
