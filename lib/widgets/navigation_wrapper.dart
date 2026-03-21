import 'package:flutter/material.dart';
import '../theme.dart';
import '../screens/dashboard.dart';
import '../screens/badges.dart';
import '../screens/leaderboard.dart';
import '../screens/settings.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const BadgesScreen(),
    const LeaderboardScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: AppColors.primaryBlue, // Culoarea 3F81BF definită de tine
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Badge-uri'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Top'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setări'),
        ],
      ),
    );
  }
}