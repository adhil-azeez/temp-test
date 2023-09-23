import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Inter",
        primaryColor: const Color(0xff08005F),
        scaffoldBackgroundColor: const Color(0xFFF7F6FF),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          )),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return const Color(0xFF08005F);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color(0xFF423A95);
            }
            return const Color(0xFFEBE9FF);
          }),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(18)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
        )),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
