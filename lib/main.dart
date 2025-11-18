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
              seasons: ["Winter", "Spring", "Summer", "Autumn"],
            ),
            SeasonCard(
              country: "CAMBODIA",
              seasons: ["Dry Season", "Rainy Season"],
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

  // Computed: current season name
  String get currentSeason => widget.seasons[currentIndex];

  // Computed: color based on season
  Color get cardColor {
    switch (currentSeason) {
      case "Winter":
        return Colors.blue.shade300;
      case "Spring":
        return Colors.green.shade300;
      case "Summer":
        return Colors.yellow.shade400;
      case "Autumn":
        return Colors.orange.shade300;
      case "Dry Season":
        return Colors.brown.shade300;
      case "Rainy Season":
        return Colors.blue.shade600;
      default:
        return Colors.grey;
    }
  }

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
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              widget.country,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              currentSeason,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
