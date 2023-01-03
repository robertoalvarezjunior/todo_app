import 'dart:convert';

import 'package:flutter/material.dart';

class Department extends ChangeNotifier {
  String? id;
  String? title;
  Color? color;
  Department({
    this.id,
    this.title,
    this.color,
  });

  List<Department> departmentList = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color?.value,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      color: map['color'] != null ? Color(map['color'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source) as Map<String, dynamic>);
}
