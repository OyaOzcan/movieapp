import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  String? id;
  String name;
  String type;
  String director;

  Movie(this.name, this.type, this.director);

  Movie.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        type = map["type"],
        director = map["director"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "type" : type,
      "director": director,
    };
  }
}
