import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/departamentos.dart';

class SaveDepartamentos extends ChangeNotifier {
  saveDepartment(
      BuildContext context, String title, Color color, Departamentos value) {
    final depart = Departamentos(
      id: Random().nextDouble().toString(),
      title: title,
      color: color,
    );
    value.departamentosList.add(depart);
    Navigator.of(context).pop();
    notifyListeners();
  }
}
