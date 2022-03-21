import 'package:flutter/material.dart';
import './providers/animation_fab_card_provider.dart';
import './providers/animation_fab_pack_provider.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './providers/card_packs_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CardPacksProvider>(create: (_) => CardPacksProvider(),), //Singleton?
      ChangeNotifierProvider<AnimationFabPackProvider>(create: (_) => AnimationFabPackProvider(),),
      ChangeNotifierProvider<AnimationFabCardProvider>(create: (_) => AnimationFabCardProvider(),),
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
