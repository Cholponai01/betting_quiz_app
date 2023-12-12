import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _images = [
    'assets/png_images/first_image.png',
    'assets/png_images/football_stadium.png',
    'assets/png_images/soccer_teams.png',
    'assets/png_images/soccer_terms.png',
    'assets/png_images/soccer_player.png',
    'assets/png_images/soccer_match.png',
    'assets/png_images/national_team.png',
    'assets/png_images/match_results.png',
  ];

  List<String> texts = [
    'Elementary level',
    'Soccer stadiums',
    'Soccer teams',
    'Soccer terms',
    'Guess the soccer player',
    'Guess a soccer match',
    'Guess the national team',
    'Guess match results',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A4FC8),
      appBar: AppBar(
        backgroundColor: const Color(0xff2D7AE5),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 87,
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF2A4FC8),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 37,
                    child: Text(
                      '50',
                      style: TextStyle(
                        color: Color(0xFFF8F804),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF8F804), Color(0xFFFBA802)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Color(0xffE97C01),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.00),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: texts.length,
          itemBuilder: (BuildContext context, int index) {
            String pngPath = _images[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(pngPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg_images/fog.svg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          texts[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                 
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 16),
                        for (int i = 0; i < 3; i++)
                          SvgPicture.asset('assets/svg_images/Star.svg',
                              height: 37,
                              width: 37,
                              // ignore: deprecated_member_use
                              color: Colors.yellow // Color(0xFF406FD6),
                              ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
