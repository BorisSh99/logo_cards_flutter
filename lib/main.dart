import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './providers/card_packs_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => CardPacksProvider(), //Singleton?
    child: MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    ),
  ));
}
