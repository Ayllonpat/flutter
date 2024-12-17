import 'package:flutter/material.dart';

class Mainmenuscreen extends StatefulWidget {
  const Mainmenuscreen({super.key});

  @override
  State<Mainmenuscreen> createState() => _MainmenuscreenState();
}

class _MainmenuscreenState extends State<Mainmenuscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 247, 228, 100),
        title: Text('FILMAPI'),
      ),
    );
  }
}