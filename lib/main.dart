import 'package:flutter/material.dart';
import 'package:motus/ui/common/bottomNav/bottom_nav.dart';
import 'package:motus/ui/pages/accueil/accueil_page.dart';

void main() {
  runApp(const MyApp());
}

// Leaderboard
// Profile
// Ecran de jeu

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Motus game',
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const BottomNav(),
          );
        });
  }
}
