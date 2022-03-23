import 'dart:convert';
import 'package:info_cinema/model/model.dart';

class MejoresCalificados {
  MejoresCalificados({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Peliculas> results;
  int totalPages;
  int totalResults;

  factory MejoresCalificados.fromJson(String str) => MejoresCalificados.fromMap(json.decode(str));


  factory MejoresCalificados.fromMap(Map<String, dynamic> json) => MejoresCalificados(
    page: json["page"],
    results: List<Peliculas>.from(json["results"].map((x) => Peliculas.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}