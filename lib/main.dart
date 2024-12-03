import 'package:flutter/material.dart';
import 'package:i_lock_the_door/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFE8235),
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFFE8235),
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF33122F),
            onSecondary: Color(0xFFFFFFFF),
            error: Color.fromARGB(255, 235, 61, 61),
            onError: Color(0xFFFFFFFF),
            background: Color(0xFFFFFFFF),
            onBackground: Color(0xFF000000),
            surface: Color(0xFFFEF3E7),
            onSurface: Color(0xFFFFFFFF)),
        primarySwatch: MaterialColor(
          0xFFFE8235,
          <int, Color>{
            50: Color(0xFFFFB89C),
            100: Color(0xFFFFA07A),
            200: Color(0xFFFF8D58),
            300: Color(0xFFFF7A36),
            400: Color(0xFFFF6724),
            500: Color(0xFFFE8235),
            600: Color(0xFFFD7023),
            700: Color(0xFFFD5D11),
            800: Color(0xFFFC4A00),
            900: Color(0xFFFB3600),
          },
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: "Epilogue",
            fontSize: 26,
            color: Color(0xFF371B34),
          ),
          bodyLarge: TextStyle(
              fontFamily: "Epilogue", fontSize: 22, color: Color(0xFF573926)),
          labelLarge: TextStyle(
              fontFamily: "Epilogue", fontSize: 14, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color(0xFFFE8235)), // Cor de fundo
            foregroundColor:
                MaterialStateProperty.all(Colors.white), // Cor do texto
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 16,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Ajuste o valor para reduzir o raio
              ),
            ),
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
