import 'package:flutter/material.dart';
import '../theme.dart';

class ScenariuJoc extends StatelessWidget {
  final String titlu;
  final String intrebare;
  final List<String> optiuni;

  const ScenariuJoc({
    super.key,
    required this.titlu,
    required this.intrebare,
    required this.optiuni,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlu),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Zona cu problema (Cardul alb)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primaryBlue.withOpacity(0.3)),
              ),
              child: Text(
                intrebare,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textBlack),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            // Butoanele de decizie (Opțiunile)
            ...optiuni.map((varianta) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textBlack,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () {
                      // Logica de validare (o facem pasul următor)
                      print("Utilizatorul a ales: $varianta");
                    },
                    child: Text(
                      varianta, 
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}