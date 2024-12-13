import 'package:flutter/material.dart';

class PeopleDetailsScreen extends StatefulWidget {
  const PeopleDetailsScreen({super.key});

  @override
  State<PeopleDetailsScreen> createState() => _PeopleDetailsScreenState();
}

class _PeopleDetailsScreenState extends State<PeopleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Hero(tag: Row, child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Text(
                    'StarWars',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'StarWars',
                    ),
                  ),
                  Image(image: AssetImage(
                 'assets/images/estrellita.png',),
                  width: 40,  
              ),
            ],
          ),
          )
      ),
      body: const Center(
        
          child: Text('.'),
        )
    );
  }
  
}