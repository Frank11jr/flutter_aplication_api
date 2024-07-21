import 'package:flutter/material.dart';
import 'package:flutter_application_api/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super .key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto en Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      useMaterial3: true
    ),
    home: const HomeScreen(),
    );
  }
}