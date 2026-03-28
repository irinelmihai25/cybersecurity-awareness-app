import 'package:flutter/material.dart';
import '../theme.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Clasament", 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Icon(Icons.emoji_events_outlined, size: 40, color: AppColors.primaryBlue),
            
            const SizedBox(height: 30),

            // 1. Zona Podiumului (Top 3)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildPodiumUser("2.User2", 60), // Locul 2
                  _buildPodiumUser("1.User1", 85, estePrimul: true), // Locul 1 (mai mare)
                  _buildPodiumUser("3.User3", 60), // Locul 3
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 2. Lista Restului de Utilizatori (Scrollabilă)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Culoarea gri din Figma ta
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: 7, // De la 4 la 10
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    int pozitie = index + 4;
                    return ListTile(
                      leading: Text("$pozitie.", 
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      title: Text("User$pozitie"),
                      trailing: const Text("1200 XP", 
                          style: TextStyle(color: AppColors.primaryBlue)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pentru cercurile de pe podium
  Widget _buildPodiumUser(String nume, double dimensiune, {bool estePrimul = false}) {
    return Column(
      children: [
        if (estePrimul) 
          const Icon(Icons.workspace_premium, color: Colors.amber, size: 30),
        Container(
          width: dimensiune,
          height: dimensiune,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            shape: BoxShape.circle,
            border: estePrimul ? Border.all(color: Colors.amber, width: 3) : null,
          ),
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(nume, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}