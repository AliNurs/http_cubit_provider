import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http on Cubit',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit on http'),
        ),
        body: const Center(
          child: Text('Http on Cubit'),
        ),
      ),
    );
  }
}
