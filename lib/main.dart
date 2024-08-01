import 'package:flutter/material.dart';
import 'screens/item_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemList(),
    );
  }
}