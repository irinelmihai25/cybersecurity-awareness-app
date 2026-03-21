import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/navigation_wrapper.dart';

void main() {
  runApp(const CyberSecurityApp());
}

class CyberSecurityApp extends StatelessWidget {
  const CyberSecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyber Security Game',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background, // Folosim culoarea din Figma
        useMaterial3: true,
      ),
      home: const NavigationWrapper(),
    );
  }
}