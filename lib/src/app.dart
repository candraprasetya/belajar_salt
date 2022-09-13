import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Belajar Dengan SALT',
      home: HomeScreen(),
    );
  }
}
