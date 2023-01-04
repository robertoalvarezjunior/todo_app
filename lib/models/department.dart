import 'dart:convert';

import 'package:flutter/material.dart';

class Department extends ChangeNotifier {
  String? idDepart;
  String? titleDepart;
  Color? colorDepart;
  Department({
    this.idDepart,
    this.titleDepart,
    this.colorDepart,
  });

  List<Department> departmentList = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idDepart,
      'title': titleDepart,
      'color': colorDepart?.value,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      idDepart: map['id'] != null ? map['id'] as String : null,
      titleDepart: map['title'] != null ? map['title'] as String : null,
      colorDepart: map['color'] != null ? Color(map['color'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source) as Map<String, dynamic>);
}
