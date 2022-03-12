import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.light(),
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
    },
  ));
}
