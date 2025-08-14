import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const DonimosApp());
}

class DonimosApp extends StatelessWidget {
  const DonimosApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donimos Veg Pizza',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
