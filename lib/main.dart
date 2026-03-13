import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/home_screen.dart';
import 'package:zen_leader/screens/profile_screen.dart';
import 'package:zen_leader/screens/explore_screen.dart';
import 'package:zen_leader/screens/leaderboard_screen.dart';
import 'package:zen_leader/screens/forum_screen.dart';
import 'package:zen_leader/screens/onboarding_screen.dart';
import 'package:zen_leader/screens/programs_screen.dart';
import 'package:zen_leader/screens/practice_screen.dart';
import 'package:zen_leader/screens/insights_screen.dart';
import 'package:zen_leader/screens/article_detail_screen.dart';

void main() {
  runApp(const ZenLeaderApp());
}

class ZenLeaderApp extends StatelessWidget {
  const ZenLeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Institute for Zen Leadership',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryBlue,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    ProgramsScreen(),
    PracticeScreen(),
    InsightsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 10),
          unselectedLabelStyle: GoogleFonts.nunito(fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Programs'),
            BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'Practice'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Insights'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
