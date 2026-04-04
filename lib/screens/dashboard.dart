import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/mission_card.dart';
import 'scenariu_email.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Variabila de scor (va evolua pe masura ce joci)
  int currentXP = 1250;

  // Logica pentru imaginea Pet-ului in functie de XP
  String _getPetAsset() {
    if (currentXP < 500) return 'assets/pet/pet1.png';
    if (currentXP < 1500) return 'assets/pet/pet2.png';
    return 'assets/pet/pet3.png';
  }

  // Logica pentru titlul nivelului
  String _getLevelTitle() {
    if (currentXP < 500) return "Nivel 1: Novice";
    if (currentXP < 1500) return "Nivel 2: Intermediar";
    return "Nivel 3: Expert Cyber";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Stack ne permite sa punem elemente unul peste altul (Pet-ul peste lista)
        child: Stack(
          children: [
            // --- STRATUL 1: CONTINUTUL PAGINII (SCROLLABLE) ---
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Randul cu Nivel si Scor
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _getLevelTitle(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        Text(
                          "Scor: $currentXP XP",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Bara de Progres XP
                    _buildXPBar(context),

                    const SizedBox(height: 35),

                    // Titlu Misiuni
                    const Text(
                      "Misiuni Disponibile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // LISTA DE MISIUNI
                    MissionCard(
                      title: "Atac Phishing",
                      description: "Învață să identifici e-mailurile capcană.",
                      icon: Icons.alternate_email,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScenariuEmail()),
                        );
                      },
                    ),

                    MissionCard(
                      title: "Securitate Parole",
                      description: "Cât de sigură este parola ta actuală?",
                      icon: Icons.lock_outline,
                      onTap: () {
                        // TEST: Creste XP-ul cu 300 la fiecare click pentru a vedea evolutia Pet-ului
                        setState(() {
                          currentXP += 300;
                        });
                      },
                    ),

                    MissionCard(
                      title: "Dispozitive USB",
                      description: "Pericolul stick-urilor găsite pe stradă.",
                      icon: Icons.usb,
                      onTap: () {
                        // Placeholder pentru viitoarea misiune USB
                        print("Misiune USB selectata");
                      },
                    ),

                    // Spatiu extra jos pentru ca Pet-ul sa nu acopere ultima misiune la scroll
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),

            // --- STRATUL 2: PET-UL PLUTITOR (DREAPTA JOS) ---
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Mic "speech bubble" (Optional)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: const Text(
                      "Ai mesaje noi!",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Avatarul Pet-ului
                  GestureDetector(
                    onTap: () {
                      // Actiune la click pe Pet (ex: un mesaj de incurajare)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Sunt asistentul tău de securitate!")),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryBlue, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          _getPetAsset(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget separat pentru bara de XP ca sa pastram codul curat
  Widget _buildXPBar(BuildContext context) {
    double progressPercent = (currentXP / 3000).clamp(0.0, 1.0);
    return Stack(
      children: [
        Container(
          height: 16,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
        ),
        Container(
          height: 16,
          // Latimea verde calculata dinamic
          width: (MediaQuery.of(context).size.width - 40) * progressPercent,
          decoration: BoxDecoration(
            color: AppColors.xpGreen,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}