import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/department.dart';

class SaveDepartment extends ChangeNotifier {
  saveDepartment(
      BuildContext context, String title, Color color, Department value) async {
    final depart = Department(
      id: Random().nextDouble().toString(),
      title: title,
      color: color,
    );
    value.departmentList.add(depart);
    Navigator.of(context).pop();

    notifyListeners();
  }
}
