import 'package:flutter/material.dart';
import 'views/main_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color crema = Color(0xFFFFF8E7);
    const Color dorado = Color(0xFFB8860B);

    return MaterialApp(
      title: 'P2 IPC - Listado Dinámico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: crema,
        primaryColor: dorado,
        appBarTheme: const AppBarTheme(
          backgroundColor: dorado,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
          titleLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
      ),
      home: const MainView(),
    );
  }
}
