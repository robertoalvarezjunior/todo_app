import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/models/container_colors.dart';

class ContainerColorSelect extends ChangeNotifier {
  bool color1;
  bool color2;
  bool color3;
  bool color4;
  ContainerColorSelect({
    this.color1 = false,
    this.color2 = false,
    this.color3 = false,
    this.color4 = false,
  });
  color1IsSelected() {
    if (color1 == true) {
      color2 = false;
      color3 = false;
      color4 = false;
      colorChange = ContainerColors.colors['color1'];
      notifyListeners();
    }
  }

  color2IsSelected() {
    if (color2 == true) {
      color1 = false;
      color3 = false;
      color4 = false;
      colorChange = ContainerColors.colors['color2'];
      notifyListeners();
    }
  }

  color3IsSelected() {
    if (color3 == true) {
      color1 = false;
      color2 = false;
      color4 = false;
      colorChange = ContainerColors.colors['color3'];
      notifyListeners();
    }
  }

  color4IsSelected() {
    if (color4 == true) {
      color1 = false;
      color2 = false;
      color3 = false;
      colorChange = ContainerColors.colors['color4'];
      notifyListeners();
    }
  }
}
