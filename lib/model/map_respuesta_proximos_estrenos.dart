import 'dart:convert';

import 'package:info_cinema/model/model.dart';

class ProximosEstrenos {
  ProximosEstrenos({
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

  factory ProximosEstrenos.fromJson(String str) => ProximosEstrenos.fromMap(json.decode(str));

  factory ProximosEstrenos.fromMap(Map<String, dynamic> json) => ProximosEstrenos(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<Peliculas>.from(json["results"].map((x) => Peliculas.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}