import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: SeasonApp()),
);

class SeasonApp extends StatelessWidget {
  const SeasonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SeasonCard(
              country: "FRANCE",
              seasons: [
                "assets/winter.jpeg",
                "assets/spring.jpeg",
                "assets/summer.jpeg",
                "assets/fall.jpeg",
              ],
            ),
            SeasonCard(
              country: "CAMBODIA",
              seasons: ["assets/summer.jpeg", "assets/fall.jpeg"],
            ),
          ],
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({super.key, required this.country, required this.seasons});

  final String country;
  final List<String> seasons;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentIndex = 0;

  String get currentSeasonImage => widget.seasons[currentIndex];

  String get currentSeasonLabel =>
      "Season  ${currentIndex + 1}"; // You can change to real names later

  void nextSeason() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.seasons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextSeason,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                currentSeasonImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            // --- COUNTRY NAME ---
            Text(
              widget.country,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // --- SEASON LABEL ---
            Text(
              currentSeasonLabel,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
