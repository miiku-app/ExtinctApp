import 'package:extinct_app/presentacion/home/home_page.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0x00FEDDBE);

class ExtinctApp extends StatelessWidget {
  const ExtinctApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Extinct',
      theme: ThemeData.dark(), //poner en modo oscuro
      home: const HomePage(),
    );
  }
}
