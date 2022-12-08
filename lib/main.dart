import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/container_color_select.dart';
import 'package:todo_app/controllers/save_departamentos.dart';
import 'package:todo_app/models/departamentos.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SaveDepartamentos(),
        ),
        ChangeNotifierProvider(
          create: (context) => Departamentos(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContainerColorSelect(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff305AFA),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xff305AFA),
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Color(0xff305AFA),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
