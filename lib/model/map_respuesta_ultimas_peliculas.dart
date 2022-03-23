import 'dart:convert';
import 'package:info_cinema/model/model.dart';

class UltimasPeliculas {
  UltimasPeliculas({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Peliculas> results;
  int totalPages;
  int totalResults;

  factory UltimasPeliculas.fromJson(String str) => UltimasPeliculas.fromMap(json.decode(str));

  factory UltimasPeliculas.fromMap(Map<String, dynamic> json) => UltimasPeliculas(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<Peliculas>.from(json["results"].map((x) => Peliculas.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toMap() => {
    "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}
