import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/tab_screen.dart';

final Theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness:Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0)
  ),
  textTheme: GoogleFonts.latoTextTheme()
);

void main(){
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:const TabScreen(),
    );
  }
}