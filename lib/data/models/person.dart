import 'dart:convert';

import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final String city;
  final String photo;
  final int age;

  const Person({
    required this.name,
    required this.city,
    required this.photo,
    required this.age,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: '${json['name']['first']} ${json['name']['last']}',
      city: json['location']['city'],
      photo: json['picture']['large'],
      age: json['dob']['age'],
    );
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'],
      city: map['city'],
      photo: map['photo'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'photo': photo,
      'age': age,
    };
  }

  static String encode(List<Person> people) {
    return json.encode(
      people.map<Map<String, dynamic>>((person) => person.toJson()).toList(),
    );
  }

  static List<Person> decode(String? people) {
    return (json.decode(people ?? '') as List<dynamic>)
        .map<Person>((person) => Person.fromMap(person))
        .toList();
  }

  Person copyWith({
    String? name,
    String? city,
    String? photo,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      city: city ?? this.city,
      photo: photo ?? this.photo,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'Person(name: $name, city: $city, photo: $photo, age: $age)';
  }

  @override
  List<Object?> get props => [name, city, photo, age];
}
