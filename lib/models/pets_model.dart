// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pet {
  int id;
  String name;
  String gender;
  String image;
  int age;
  bool adopted;
  Pet({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.age,
    required this.adopted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'image': image,
      'age': age,
      'adopted': adopted,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
      age: map['age'] as int,
      adopted: map['adopted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) =>
      Pet.fromMap(json.decode(source) as Map<String, dynamic>);
}
