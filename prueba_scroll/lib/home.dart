import 'package:flutter/material.dart';

class HomeActores extends StatelessWidget {
  const HomeActores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.only(top: 80, left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best Iranian Actors',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'and Actresses',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'March 2020',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ActorCard(
                  imageUrl: 'https://media.themoviedb.org/t/p/w600_and_h900_bestv2/lbsd2lAIQq4egOUXDIfjhte12vv.jpg',
                  name: 'Golshifteh Farahani',
                ),
                ActorCard(
                  imageUrl: 'https://www.gettyimages.es/detail/fotograf%C3%ADa-de-noticias/navid-mohammadzadeh-receives-orizzonti-award-fotograf%C3%ADa-de-noticias/844969586',
                  name: 'Navid Mohammadzadeh',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ActorCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const ActorCard({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 180,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, width: 180, height: 180, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
