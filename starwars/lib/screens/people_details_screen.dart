import 'package:flutter/material.dart';
import 'package:starwars/models/people_list_response/people.dart';

class PeopleDetailsScreen extends StatefulWidget {
  final People person;

  const PeopleDetailsScreen({super.key, required this.person});

  @override
  State<PeopleDetailsScreen> createState() => _PeopleDetailsScreenState();
}

class _PeopleDetailsScreenState extends State<PeopleDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'StarWars',
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontFamily: 'StarWars',
              ),
            ),
            const SizedBox(width: 8),
            const Image(
              image: AssetImage('assets/images/estrellita.png'),
              width: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _scrollController,
              builder: (context, child) {
                double offset = _scrollController.offset;
                double height = 600 - offset * 0.8;
                if (height < 150) height = 150;
                return Hero(
                  tag: widget.person.name!,
                  child: Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0), 
                        child: Container(
                          width: double.infinity,
                          height: height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.colorBurn),
                              alignment: Alignment.topCenter,
                              image: NetworkImage(
                                "https://starwars-visualguide.com/assets/img/characters/${widget.person.url!.split('/')[5]}.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              widget.person.name ?? 'N/A',
              style: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'StarWars',
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailText(Icons.cake, 'Birth Year', widget.person.birthYear),
            _buildDetailText(Icons.person, 'Gender', widget.person.gender),
            _buildDetailText(Icons.height, 'Height', widget.person.height),
            _buildDetailText(Icons.color_lens, 'Hair Color', widget.person.hairColor),
            _buildDetailText(Icons.visibility, 'Eye Color', widget.person.eyeColor),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.yellow,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'StarWars',
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'StarWars',
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
