import 'package:flutter/material.dart';
import '../ui/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Theme App',
      theme: ThemeData.light(), // Tema terang (default)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.dark, // Pakai tema dark secara default
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
