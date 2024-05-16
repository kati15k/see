import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';

class ClubListScreen extends StatelessWidget {
  final List<Map<String, String>> clubs = [
    {
      'name': 'Chess Club',
      'details':
      'Join us for strategic battles on the chessboard! Improve your skills and meet new friends in a welcoming environment.',
    },
    {
      'name': 'Debate Club',
      'details':
      'Sharpen your argumentative skills and engage in lively debates! Whether you\'re passionate about politics, philosophy, or current events, there\'s a place for you here.',
    },
    {
      'name': 'Coding Club',
      'details':
      'Learn to code and build amazing projects together! Whether you\'re a beginner or an experienced programmer, we welcome all skill levels.',
    },
    {
      'name': 'Art Club',
      'details':
      'Express yourself through various forms of art and creativity! Join us for painting sessions, sculpture workshops, and more.',
    },
    {
      'name': 'Music Club',
      'details':
      'Make beautiful music and perform on stage! Whether you play an instrument, sing, or just enjoy listening, there\'s something for everyone in our music club.',
    },
    {
      'name': 'Sports Club',
      'details':
      'Stay active and compete in various sports! From basketball to soccer, join us for friendly competitions and teamwork.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Clubs'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: ListView.builder(
          itemCount: clubs.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            clubs[index]['name']!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClubDetailsScreen(
                                  club: clubs[index],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward),
                          label: Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClubDetailsScreen extends StatelessWidget {
  final Map<String, String> club;

  ClubDetailsScreen({required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          club['name']!,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    club['details']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print('Join ${club['name']}');
                },
                child: Text('Join'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
