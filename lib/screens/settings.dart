import 'package:flutter/material.dart';
import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Setări", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              
              // Profil Utilizator
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: AppColors.primaryBlue),
              ),
              const SizedBox(height: 10),
              const Text("Nume Utilizator", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),

              // Secțiunile de Setări
              _buildSectiune("SECURITATE CONT", [
                _buildRandSetare(Icons.vpn_key, "Schimbă Parola"),
                _buildRandSetare(Icons.security, "Autentificare 2FA"),
              ]),
              
              _buildSectiune("PREFERINȚE JOC", [
                _buildRandSetare(Icons.notifications, "Notificări Misiuni"),
                _buildRandSetare(Icons.volume_up, "Efecte Sonore"),
              ]),

              _buildSectiune("SUPORT ȘI LEGAL", [
                _buildRandSetare(Icons.privacy_tip, "Politica de Confidențialitate"),
                _buildRandSetare(Icons.help, "Ajutor & Suport"),
                _buildRandSetare(Icons.logout, "Ieșire din cont / Logout", color: AppColors.errorRed),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper pentru titlul secțiunii
  Widget _buildSectiune(String titlu, List<Widget> copii) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(titlu, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ...copii,
        const SizedBox(height: 20),
      ],
    );
  }

  // Widget Helper pentru fiecare rând
  Widget _buildRandSetare(IconData icon, String text, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.primaryBlue),
      title: Text(text, style: TextStyle(color: color ?? AppColors.textBlack)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}