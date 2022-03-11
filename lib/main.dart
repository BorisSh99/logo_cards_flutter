import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    darkTheme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
    },
  ));
}
