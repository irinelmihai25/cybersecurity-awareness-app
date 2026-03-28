import 'package:flutter/material.dart';
import '../theme.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulată cu datele insignelor. Mai târziu le poți prelua din baza de date.
    final List<Map<String, dynamic>> insigne = [
      {'icon': Icons.rocket_launch, 'titlu': 'Bun venit!', 'esteDeblocata': true},
      {'icon': Icons.alternate_email, 'titlu': 'Expert Phishing', 'esteDeblocata': false},
      {'icon': Icons.vpn_key, 'titlu': 'Gardian Parole', 'esteDeblocata': false},
      {'icon': Icons.usb_off, 'titlu': 'Scut Fizic', 'esteDeblocata': false},
      {'icon': Icons.menu_book, 'titlu': 'Cunoscător Teorie', 'esteDeblocata': false},
      {'icon': Icons.emoji_events, 'titlu': 'Campion', 'esteDeblocata': false},
      {'icon': Icons.shield, 'titlu': 'Maestru Cyber', 'esteDeblocata': false},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Permite scroll-ul pe întreg ecranul
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titlu mai spațios
              const Text(
                "Insigne", 
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                )
              ),
              const SizedBox(height: 10),
              const Text(
                "Progresul tău în securitate", 
                style: TextStyle(fontSize: 16, color: Colors.grey)
              ),
              const SizedBox(height: 40),

              // Grila de insigne (folosim GridView.builder pentru eficientă)
              GridView.builder(
                shrinkWrap: true, // Important: îi spune Grid-ului să se adapteze în SingleChildScrollView
                physics: const NeverScrollableScrollPhysics(), // Scroll-ul este gestionat de SingleChildScrollView
                itemCount: insigne.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 coloane pentru un design mai aerisit
                  crossAxisSpacing: 25, // Spațiu orizontal generos
                  mainAxisSpacing: 25,  // Spațiu vertical generos
                  childAspectRatio: 1.0, // Face elementele pătrate
                ),
                itemBuilder: (context, index) {
                  final data = insigne[index];
                  return _buildInsignaImbunatatita(
                    icon: data['icon'], 
                    titlu: data['titlu'], 
                    esteDeblocata: data['esteDeblocata']
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper pentru o insignă îmbunătățită
  Widget _buildInsignaImbunatatita({
    required IconData icon, 
    required String titlu, 
    required bool esteDeblocata
  }) {
    return Container(
      decoration: BoxDecoration(
        color: esteDeblocata ? AppColors.white : Colors.grey[200], // Fundal alb dacă e deblocată
        borderRadius: BorderRadius.circular(25), // Colțuri rotunjite
        boxShadow: esteDeblocata ? [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8), // Efect de umbră dedesubt
          ),
        ] : [], // Fără umbră dacă e blocată
        border: esteDeblocata ? Border.all(color: AppColors.primaryBlue.withOpacity(0.1), width: 1) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Cercul cu iconița (ca în Figma, dar mai stilizat)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: esteDeblocata ? AppColors.primaryBlue.withOpacity(0.1) : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon, 
              color: esteDeblocata ? AppColors.primaryBlue : Colors.grey[500], 
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          // Titlul insignei (un plus față de Figma pentru claritate)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              titlu, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.w600, 
                color: esteDeblocata ? AppColors.textBlack : Colors.grey[600],
              )
            ),
          ),
        ],
      ),
    );
  }
}