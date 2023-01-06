import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/container_color_select.dart';
import 'package:todo_app/controllers/save_department.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/database/table.dart';
import 'package:todo_app/models/container_colors.dart';
import 'package:todo_app/models/department.dart';

class DialogDepartment extends StatelessWidget {
  DialogDepartment({
    Key? key,
    required this.saveDepartmentValue,
    required this.departmentValue,
  }) : super(key: key);
  final SaveDepartment saveDepartmentValue;
  final Department departmentValue;
  final departmentController = TextEditingController();
  final _departmentKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              key: _departmentKey,
              decoration: const InputDecoration(labelText: 'Título Anotação'),
              controller: departmentController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                if (_departmentKey.currentState!.validate()) {
                  saveDepartmentValue.saveDepartment(
                    context,
                    departmentController.text,
                    colorChange ?? ContainerColors.colors['color1']!,
                    departmentValue,
                  );
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo Obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Consumer<ContainerColorSelect>(
              builder: (context, containerColorSelectValue, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      containerColorSelectValue.color1 =
                          !containerColorSelectValue.color1;
                      containerColorSelectValue.color1IsSelected();
                    },
                    child: Container(
                      height: sizeColorsModalSheet,
                      width: sizeColorsModalSheet,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: containerColorSelectValue.color1 == true
                              ? Colors.black38
                              : Colors.transparent,
                        ),
                        color: ContainerColors.colors['color1'],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      containerColorSelectValue.color2 =
                          !containerColorSelectValue.color2;
                      containerColorSelectValue.color2IsSelected();
                    },
                    child: Container(
                      height: sizeColorsModalSheet,
                      width: sizeColorsModalSheet,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: containerColorSelectValue.color2 == true
                              ? Colors.black38
                              : Colors.transparent,
                        ),
                        color: ContainerColors.colors['color2'],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      containerColorSelectValue.color3 =
                          !containerColorSelectValue.color3;
                      containerColorSelectValue.color3IsSelected();
                    },
                    child: Container(
                      height: sizeColorsModalSheet,
                      width: sizeColorsModalSheet,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: containerColorSelectValue.color3 == true
                              ? Colors.black38
                              : Colors.transparent,
                        ),
                        color: ContainerColors.colors['color3'],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      containerColorSelectValue.color4 =
                          !containerColorSelectValue.color4;
                      containerColorSelectValue.color4IsSelected();
                    },
                    child: Container(
                      height: sizeColorsModalSheet,
                      width: sizeColorsModalSheet,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: containerColorSelectValue.color4 == true
                              ? Colors.black38
                              : Colors.transparent,
                        ),
                        color: ContainerColors.colors['color4'],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Consumer<TableConfig>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () async {
                  if (_departmentKey.currentState!.validate()) {
                    saveDepartmentValue.saveDepartment(
                      context,
                      departmentController.text,
                      colorChange ?? ContainerColors.colors['color1']!,
                      departmentValue,
                    );
                    Database db = await DB.instance.database;
                    value.createNewTable(departmentController.text, db);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
