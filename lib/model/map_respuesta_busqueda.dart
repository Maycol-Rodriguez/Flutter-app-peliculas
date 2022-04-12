// To parse this JSON data, do
//
//     final busqueda = busquedaFromMap(jsonString);

import 'dart:convert';

import 'package:info_cinema/model/model.dart';

class Busqueda {

  Busqueda({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Peliculas> results;
  int totalPages;
  int totalResults;

  factory Busqueda.fromJson(String str) => Busqueda.fromMap(json.decode(str));


  factory Busqueda.fromMap(Map<String, dynamic> json) => Busqueda(
      page: json["page"],
      results: List<Peliculas>.from(json["results"].map((x) => Peliculas.fromMap(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
  );
}