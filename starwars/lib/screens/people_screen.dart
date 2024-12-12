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

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        title: const Text('StarWars', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Caudex'),),
        backgroundColor: const Color.fromARGB(255, 1, 22, 61),
      ),
      body: FutureBuilder<PeopleListResponse>(
        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              
              children: [
                const Text('Personajes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                SizedBox(
                  width: double.infinity,
                  height: 700,
                  child: _buildPeopleList(snapshot.data!),
                )
                
              ],
            );

            
            
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(PeopleListResponse peopleResponse) {
    return ListView.builder(
        itemCount: peopleResponse.results!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(     
            height: 30,
            width: 300,
            padding: EdgeInsets.only(top: 50, bottom: 60),
            margin: EdgeInsets.only(left: 43,),
            decoration: BoxDecoration(
              
            ),
            child:Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                  child: Container(                 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black38, BlendMode.colorBurn),
                        alignment: Alignment.topCenter,
                        image: NetworkImage("https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg"), 
                        ),
                      color: const Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      children: [
                        Text(peopleResponse.results![index].name!, style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 100,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    
                                    Text(peopleResponse.results![index].birthYear!, style: TextStyle(color: Colors.white),),
                                    Text(peopleResponse.results![index].gender!, style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                Column(

                                )
                              ],
                            ),
                            
                          ],
                        ),
                        ),

                        
                      ],
                    ),
                  ),
                ),
          );      
        });

        
  }
}