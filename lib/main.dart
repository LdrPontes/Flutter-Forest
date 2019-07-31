import 'package:flutter/material.dart';
import 'package:flutter_forest/ui/home_page.dart';

void main() => runApp(ForestApp());

class ForestApp extends StatelessWidget {
  const ForestApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF50A387),
      ),
      home: HomePage(),
    );
  }
}