import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Moviesscreen extends StatefulWidget {
  const Moviesscreen({super.key});

  @override
  State<Moviesscreen> createState() => _MoviesscreenState();
}

class _MoviesscreenState extends State<Moviesscreen> {
  List movies = [];
  List filteredMovies = [];
  final String apiKey = 'a73172f9b2f5f84377847c5a9d76d375';
  TextEditingController searchController = TextEditingController();

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-ES&page=1'));
    if (response.statusCode == 200) {
      setState(() {
        movies = jsonDecode(response.body)['results'];
        filteredMovies = movies;
      });
    }
  }

  void filterMovies(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMovies = movies;
      } else {
        filteredMovies = movies
            .where((movie) =>
                (movie['title'] ?? '').toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 41, 72, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: searchController,
                onChanged: filterMovies,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Buscar películas...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Películas Populares',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Ajusta la proporción del ítem (ancho/alto)
                ),
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  final String imagePath = movie['poster_path'];

                  return Column(
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
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movie['title'] ?? 'Sin título',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
