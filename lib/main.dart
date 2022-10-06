import 'package:flutter/material.dart';
import 'package:gys_657_sorubankasi/views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          // Define the default brightness and colors.
          // primarySwatch: Colors.brown,

          // Define the default font family.
          ),
      home: const Home(),
    );
  }
}
