import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_menu/screens/categories.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
          body: SafeArea(
        child: CategoriesScreen(),
      )),
    );
  }
}
