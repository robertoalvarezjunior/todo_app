import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/container_color_select.dart';
import 'package:todo_app/controllers/save_department.dart';
import 'package:todo_app/controllers/save_product.dart';
import 'package:todo_app/models/department.dart';
import 'package:todo_app/models/product.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/product_page.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SaveDepartment(),
        ),
        ChangeNotifierProvider(
          create: (context) => Department(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContainerColorSelect(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaveProduct(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product(),
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        ProductPage.routeProductName: (context) => const ProductPage(),
      },
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
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Color(0xff305AFA),
            ),
          ),
        ),
      ),
      // home: const HomeScreen(),
    );
  }
}
