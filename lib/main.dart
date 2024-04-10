// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiler/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(
          255,
          251,
          48,
          82,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(
          249,
          249,
          249,
          1,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: const Home(),
    );
  }
}
