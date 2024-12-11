import 'people.dart';

class PeopleListResponse {
  int? count;
  String? next;
  dynamic previous;
  List<People>? results;

  PeopleListResponse({this.count, this.next, this.previous, this.results});

  factory PeopleListResponse.fromJson(Map<String, dynamic> json) {
    return PeopleListResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as dynamic,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => People.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
