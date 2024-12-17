import 'package:filmapi/screen/ActoresScreen.dart';
import 'package:filmapi/screen/HomeScreen.dart';
import 'package:filmapi/screen/MoviesScreen.dart';
import 'package:filmapi/screen/PerfilScreen.dart';
import 'package:filmapi/screen/SeriesScreen.dart';
import 'package:flutter/material.dart';

class Mainmenuscreen extends StatefulWidget {
  const Mainmenuscreen({super.key});

  @override
  State<Mainmenuscreen> createState() => _MainmenuscreenState();
}

class _MainmenuscreenState extends State<Mainmenuscreen> {

  int _currentIndex = 2;

  final List<Widget> _screens = [
    Moviesscreen(),
    Seriesscreen(),
    Homescreen(),
    Actoresscreen(),
    Perfilscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(92, 247, 228, 100),
        title: Text('FILMAPI', style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromRGBO(29, 41, 72, 1))),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, 
        onTap: (int index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Color.fromRGBO(246, 240, 152, 1),
        items: const<BottomNavigationBarItem>[       
        BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined), label: 'Peliculas'),
        BottomNavigationBarItem(icon: Icon(Icons.camera_roll_outlined), label: 'Series'),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'Actores'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Mi Perfil')
      ],
      unselectedItemColor:  Color.fromRGBO(29, 41, 72, 1),
      unselectedLabelStyle: TextStyle(color: Color.fromRGBO(29, 41, 72, 1)),
      selectedItemColor: Color.fromRGBO(233, 106, 83, 1),
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(233, 106, 83, 1)),
      ),
    );
  }
}