import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'views/login_view.dart';

void main() => runApp(const MyApp());

// 1. CAMBIO IMPORTANTE: Ahora es Stateful para poder cambiar el idioma
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  // Esta función nos permite cambiar el idioma desde cualquier pantalla
  static MyAppState? of(BuildContext context) => 
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  // Idioma por defecto: Español
  Locale _locale = const Locale('es');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 2. MANTENEMOS TUS COLORES ORIGINALES
    const Color crema = Color(0xFFFFF8E7);
    const Color dorado = Color(0xFFB8860B);

    return MaterialApp(
      title: 'Perfumería Bloom',
      debugShowCheckedModeBanner: false,
      
      // --- 3. LO NUEVO: CONFIGURACIÓN DE IDIOMAS (i18n) ---
      locale: _locale, 
      localizationsDelegates: const [
        AppLocalizations.delegate, 
        GlobalMaterialLocalizations.delegate, 
        GlobalWidgetsLocalizations.delegate, 
        GlobalCupertinoLocalizations.delegate, 
      ],
      supportedLocales: const [
        Locale('en'), // Inglés
        Locale('es'), // Español
        Locale('ca'), // Valenciano
      ],
      // ----------------------------------------------------

      // 4. MANTENEMOS TU TEMA EXACTO
      theme: ThemeData(
        scaffoldBackgroundColor: crema,
        primaryColor: dorado,
        useMaterial3: true,
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
      
      home: const LoginView(),
    );
  }
}