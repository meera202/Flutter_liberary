import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'bookprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}



