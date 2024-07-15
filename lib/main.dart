import 'package:flutter/material.dart';
import './page/main_page.dart';
import 'services/http_override.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(RadyaLabs());
}

class RadyaLabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FoodGridPage(),
    );
  }
}