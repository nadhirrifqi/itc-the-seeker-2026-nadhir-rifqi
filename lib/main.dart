import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/struktur_screen.dart';
import 'screens/detail_screen.dart';
import 'models/pengurus_itc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITC Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
      routes: {
        '/struktur': (context) => const StrukturScreen(),
        '/detail': (context) => const DetailScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final Pengurus _ = settings.arguments as Pengurus;
          return MaterialPageRoute(
            builder: (context) => const DetailScreen(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
