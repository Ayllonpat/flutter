import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List movies = [];
  List series = [];
  List actors = [];

  final String apiKey = 'a73172f9b2f5f84377847c5a9d76d375';

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-ES&page=1'));
    if (response.statusCode == 200) {
      setState(() {
        movies = jsonDecode(response.body)['results'];
      });
    }
  }

  Future<void> fetchSeries() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=es-ES&page=1'));
    if (response.statusCode == 200) {
      setState(() {
        series = jsonDecode(response.body)['results'];
      });
    }
  }

  Future<void> fetchActors() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=es-ES&page=1'));
    if (response.statusCode == 200) {
      setState(() {
        actors = jsonDecode(response.body)['results'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
    fetchSeries();
    fetchActors();
  }

  Widget buildHorizontalList(List data, String type) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          final String imagePath = type == 'actor'
              ? item['profile_path']
              : item['poster_path'];

          return Container(
            margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imagePath != null
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w300$imagePath',
                          height: 200,
                          width: 140,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 200,
                          width: 140,
                          color: Colors.grey,
                          child: Icon(Icons.broken_image,
                              color: Colors.white, size: 40),
                        ),
                ),
                SizedBox(height: 8),
                Text(
                  type == 'actor'
                      ? item['name'] ?? 'Sin nombre'
                      : item['title'] ?? item['name'] ?? 'Sin título',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 41, 72, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'LO MÁS POPULAR DEL DÍA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Películas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ),
            buildHorizontalList(movies, 'movie'),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Series',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ),
            buildHorizontalList(series, 'series'),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Actores',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ),
            buildHorizontalList(actors, 'actor'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
