import 'dart:convert';

class Creditos {
  Creditos({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Casting> cast;
  List<Casting> crew;

  factory Creditos.fromJson(String str) => Creditos.fromMap(json.decode(str));

  factory Creditos.fromMap(Map<String, dynamic> json) => Creditos(
    id: json["id"],
    cast: List<Casting>.from(json["cast"].map((x) => Casting.fromMap(x))),
    crew: List<Casting>.from(json["crew"].map((x) => Casting.fromMap(x))),
  );

}

class Casting {
  Casting({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  get getImgProfilePath{
    if( profilePath != null ) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Casting.fromJson(String str) => Casting.fromMap(json.decode(str));

  factory Casting.fromMap(Map<String, dynamic> json) => Casting(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"].toDouble(),
      profilePath: json["profile_path"] ?? json["profile_path"],
      castId: json["cast_id"] ?? json["cast_id"],
      character: json["character"] ?? json["character"],
      creditId: json["credit_id"],
      order: json["order"] ?? json["order"],
      department: json["department"] ?? json["department"],
      job: json["job"] ?? json["job"],
  );
}