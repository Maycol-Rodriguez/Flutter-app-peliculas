import 'dart:convert';
import 'package:info_cinema/model/model.dart';

class PeliculasPopulares {
  PeliculasPopulares({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Peliculas> results;
  int totalPages;
  int totalResults;

  factory PeliculasPopulares.fromJson(String str) => PeliculasPopulares.fromMap(json.decode(str)!);

  factory PeliculasPopulares.fromMap(Map<String, dynamic> json) => PeliculasPopulares(
    page: json["page"],
    results: List<Peliculas>.from(json["results"].map((x) => Peliculas.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],  
  );

}