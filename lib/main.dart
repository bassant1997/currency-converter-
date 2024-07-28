import 'dart:io';

import 'package:currency_converter/screens/home_screen.dart';
import 'package:currency_converter/config/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/database/hive_helper.dart';
import 'data/repository/http_helper.dart';

void main() async {
  await Hive.initFlutter();
  await HiveHelper.instance.initialize();
  HttpOverrides.global = MyHttpOverrides();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const HomeScreen(),
    );
  }
}
