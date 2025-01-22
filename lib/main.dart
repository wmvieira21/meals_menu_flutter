import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_menu/data/dummy_categories.dart';
import 'package:meals_menu/data/dummy_meals.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/categories.dart';
import 'package:meals_menu/screens/meals.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 131, 57, 0),
        brightness: Brightness.dark),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final List<Meal> meals = dummyMeals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
          body: SafeArea(
        child: MealsScreen(
          meals: meals,
          tittle: 'Meals',
        ),
      )),
    );
  }
}
