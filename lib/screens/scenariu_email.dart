// lib/screens/scenariu_joc.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/email_model.dart'; // IMPORT NOU

class ScenariuEmail extends StatefulWidget {
  const ScenariuEmail({super.key});

  @override
  State<ScenariuEmail> createState() => _ScenariuEmailState();
}

class _ScenariuEmailState extends State<ScenariuEmail> {
  // Ținem minte la ce mail suntem (indexul din listă)
  int _indexCurent = 0;

  @override
  Widget build(BuildContext context) {
    // Luăm e-mailul curent din listă
    final EmailSimulat email = listaEmailuriPhishing[_indexCurent];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Misiune: Phishing Inbox"),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Header (Nivel și Scor - ca în designul tău)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nivel: 1", style: TextStyle(color: Colors.grey)),
                  Text("Scor total: 0 Puncte", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 15),
              
              // 2. Instrucțiuni
              const Text(
                "Verifică e-mail-ul de mai jos și ia decizia corectă!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textBlack),
              ),
              const SizedBox(height: 25),

              // 3. ZONA DE E-MAIL (Design îmbunătățit tip client mail)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Mail (Expeditor și Subiect)
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey, // Culoarea din designul tău
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(email.expeditor, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("<${email.adresaEmail}>", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 25, thickness: 1.5),
                      // Subiect
                      Text(email.subiect, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                      const SizedBox(height: 20),
                      // Mesaj
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            email.mesaj, 
                            style: const TextStyle(fontSize: 15, color: AppColors.textBlack),
                          ),
                        ),
                      ),
                      // Link-ul simulat din designul tău
                      if (email.estePhishing)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "CLICK AICI PENTRU A ACTUALIZA PLATA",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              
              // 4. Întrebare (ca în designul tău)
              const Text(
                "Ce vei face?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 5. BUTOANE DE ACȚIUNE (ca în designul tău)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue, // Albastrul din designul tău
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _verificaDecizia(false, email); // A ales "Legitim"
                    },
                    child: const Text("Pare Legitim", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue, // Albastrul din designul tău
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _verificaDecizia(true, email); // A ales "Phishing"
                    },
                    child: const Text("Raportează la Securitate", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Logica de validare decizie
  void _verificaDecizia(bool decizieUtilizator, EmailSimulat email) {
    bool correct = (decizieUtilizator == email.estePhishing);
    
    // Deocamdată doar afișăm feedback, trecerea la următorul mail o facem pasul următor
    print(correct ? "Corect!" : "Greșit!");
  }
}