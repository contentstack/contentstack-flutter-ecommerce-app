import 'package:flutter/material.dart';
import 'homepage.dart';

class ContentstackApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eccomerce App Example',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(title: 'Eccomerce Flutter Ecommerce Example App'),
    );
  }
}