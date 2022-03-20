import 'package:flutter/material.dart';
import 'package:logophile_flutter/providers/animation_fab_provider.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './providers/card_packs_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CardPacksProvider>(create: (_) => CardPacksProvider(),), //Singleton?
      ChangeNotifierProvider<AnimationFabProvider>(create: (_) => AnimationFabProvider(),),
    ],
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
