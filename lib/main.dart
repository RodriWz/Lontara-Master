import 'package:flutter/material.dart';
import 'package:lontarata_app/pages/pages.dart';
import 'package:lontarata_app/shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ubah ke MaterialColor valid
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(201, 158, 123, 100),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 0, 0)),
          ),
          labelStyle: TextStyle(color: Colors.black),
        ),

        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
      home: LontaraHomePage(),
    );
  }
}
