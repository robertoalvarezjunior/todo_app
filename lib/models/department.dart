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
}
