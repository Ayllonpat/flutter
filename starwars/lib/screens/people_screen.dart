import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:starwars/models/people_list_response/people_list_response.dart';
import 'package:http/http.dart' as http;

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleListResponse> peopleResponse;
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
    
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: FutureBuilder<PeopleListResponse>(
        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 16.0),
                    child: Text(
                      'Personajes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'StarWars',
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 650,
                    child: _buildPeopleCarousel(snapshot.data!),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'StarWars',
                ));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget _buildPeopleCarousel(PeopleListResponse peopleResponse) {
    return PageView.builder(
      controller: _pageController,
      itemCount: peopleResponse.results!.length,
      itemBuilder: (context, index) {
        return _buildCard(peopleResponse, index);
      },
    );
  }

  Widget _buildCard(PeopleListResponse peopleResponse, int index) {
    double scale = 1.0;
    double distance = (_currentPage - index);

    scale = (1 - (distance * 0.2)).clamp(0.8, 1.0);

    return Transform.scale(
      scale: scale,
      child: Container(
        height: 30,
        width: 300,
        padding: const EdgeInsets.only(top: 50, bottom: 60),
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          color: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.colorBurn),
                alignment: Alignment.topCenter,
                image: NetworkImage(
                    "https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg"),
              ),
              color: const Color.fromARGB(255, 31, 30, 30),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    peopleResponse.results![index].name!,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'StarWars',
                      fontSize: 18.0,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 1.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birth Year: ${peopleResponse.results![index].birthYear!}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'StarWars',
                          
                        ),
                      ),
                      Text(
                        'Gender: ${peopleResponse.results![index].gender!}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'StarWars',
                          
                        ),
                      ),
                      Text(
                        'Height: ${peopleResponse.results![index].height!}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'StarWars',
                          
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(left: 55),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/people_details');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow
                            ),
                            label: const Text('ver más',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'StarWars',
                              fontSize: 13.2
                              ),
                            ),
                            icon: Image(image: AssetImage(
                              'assets/images/darth-vader.png'
                            ),
                            width: 20,
                            alignment: Alignment.centerRight,),
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
