import 'package:flutter/material.dart';

class SelectContainerColor extends ChangeNotifier {
  bool color1;
  bool color2;
  bool color3;
  bool color4;
  SelectContainerColor({
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
      // colorChange = '0xff2A7FDE';
      notifyListeners();
    }
  }

  color2IsSelected() {
    if (color2 == true) {
      color1 = false;
      color3 = false;
      color4 = false;
      // colorChange = '0xff3AC2F5';
      notifyListeners();
    }
  }

  color3IsSelected() {
    if (color3 == true) {
      color1 = false;
      color2 = false;
      color4 = false;
      // colorChange = '0xff2ADDDE';
      notifyListeners();
    }
  }

  color4IsSelected() {
    if (color4 == true) {
      color1 = false;
      color2 = false;
      color3 = false;
      // colorChange = '0xff30FAC2';
      notifyListeners();
    }
  }
}
