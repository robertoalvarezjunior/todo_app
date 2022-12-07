import 'package:flutter/material.dart';

class Departamentos extends ChangeNotifier {
  String? id;
  String? title;
  Color? color;
  Departamentos({
    this.id,
    this.title,
    this.color,
  });

  List<Departamentos> departamentosList = [];
}
