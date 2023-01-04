import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/department.dart';

class SaveDepartment extends ChangeNotifier {
  saveDepartment(
      BuildContext context, String title, Color color, Department value) async {
    final depart = Department(
      idDepart: Random().nextDouble().toString(),
      titleDepart: title,
      colorDepart: color,
    );
    value.departmentList.add(depart);
    Navigator.of(context).pop();

    notifyListeners();
  }
}
