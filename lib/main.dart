import 'package:flutter/material.dart';
import 'package:select_country_with_flag/select_country.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SelectCountry(),
    );
  }
}

