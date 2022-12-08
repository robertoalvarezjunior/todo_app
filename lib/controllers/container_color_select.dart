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
  //mudar modalsheet pra shoedialog
  colorIsSelector() {
    if (color1 == true) {
      colorChange = ContainerColors.colors['color1'];
      color2 = false;
      color3 = false;
      color4 = false;
    } else if (color2 == true) {
      colorChange = ContainerColors.colors['color2'];
      color1 = false;
      color3 = false;
      color4 = false;
    } else if (color3 == true) {
      colorChange = ContainerColors.colors['color3'];
      color1 = false;
      color2 = false;
      color4 = false;
    } else if (color4 == true) {
      colorChange = ContainerColors.colors['color4'];
      color1 = false;
      color2 = false;
      color3 = false;
    }

    notifyListeners();
  }
}
