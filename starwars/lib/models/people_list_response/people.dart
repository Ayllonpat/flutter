class People {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  List<String>? films;
  List<dynamic>? species;
  List<String>? vehicles;
  List<String>? starships;
  DateTime? created;
  DateTime? edited;
  String? url;

  People({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        name: json['name'] as String?,
        height: json['height'] as String?,
        mass: json['mass'] as String?,
        hairColor: json['hair_color'] as String?,
        skinColor: json['skin_color'] as String?,
        eyeColor: json['eye_color'] as String?,
        birthYear: json['birth_year'] as String?,
        gender: json['gender'] as String?,
        homeworld: json['homeworld'] as String?,
        films: json['films'] as List<String>?,
        species: json['species'] as List<dynamic>?,
        vehicles: json['vehicles'] as List<String>?,
        starships: json['starships'] as List<String>?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        edited: json['edited'] == null
            ? null
            : DateTime.parse(json['edited'] as String),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'height': height,
        'mass': mass,
        'hair_color': hairColor,
        'skin_color': skinColor,
        'eye_color': eyeColor,
        'birth_year': birthYear,
        'gender': gender,
        'homeworld': homeworld,
        'films': films,
        'species': species,
        'vehicles': vehicles,
        'starships': starships,
        'created': created?.toIso8601String(),
        'edited': edited?.toIso8601String(),
        'url': url,
      };
}
