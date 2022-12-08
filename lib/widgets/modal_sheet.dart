// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/container_color_select.dart';
import 'package:todo_app/controllers/save_departamentos.dart';
import 'package:todo_app/models/container_colors.dart';
import 'package:todo_app/models/departamentos.dart';

class ModalSheet extends StatelessWidget {
  ModalSheet({
    Key? key,
    required this.saveDepartamentosValue,
    required this.departamentosValue,
    required this.containerColorSelectValue,
  }) : super(key: key);
  final SaveDepartamentos saveDepartamentosValue;
  final Departamentos departamentosValue;
  final ContainerColorSelect containerColorSelectValue;
  final departamentosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: departamentosController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) =>
                saveDepartamentosValue.saveDepartamentos(
              context,
              departamentosController.text,
              Colors.red,
              departamentosValue,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  containerColorSelectValue.color1 =
                      !containerColorSelectValue.color1;
                  containerColorSelectValue.colorIsSelector();
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
                  containerColorSelectValue.colorIsSelector();
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
                  containerColorSelectValue.colorIsSelector();
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
                  containerColorSelectValue.colorIsSelector();
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
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              saveDepartamentosValue.saveDepartamentos(
                context,
                departamentosController.text,
                colorChange!,
                departamentosValue,
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                'Salvar',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
