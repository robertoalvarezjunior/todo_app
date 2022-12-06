// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/animation.dart';

class Departamentos {
  String id;
  String title;
  Color color;
  Departamentos({
    required this.id,
    required this.title,
    required this.color,
  });

  // Departamentos({
  //   required this.id,
  //   required this.title,
  //   required this.color,
  // });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'color': color.value,
  //   };
  // }

  // static Departamentos fromMap(Map<String, dynamic> map) => Departamentos(
  //       id: map['id'],
  //       title: map['title'],
  //       color: map['color'],
  //     );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color,
    };
  }

  factory Departamentos.fromMap(Map<String, dynamic> map) {
    return Departamentos(
      id: map['id'] as String,
      title: map['title'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Departamentos.fromJson(String source) =>
      Departamentos.fromMap(json.decode(source) as Map<String, dynamic>);
}
