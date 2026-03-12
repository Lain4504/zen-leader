import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/home_screen.dart';
import 'package:zen_leader/screens/profile_screen.dart';
import 'package:zen_leader/screens/explore_screen.dart';
import 'package:zen_leader/screens/leaderboard_screen.dart';
import 'package:zen_leader/screens/forum_screen.dart';

void main() {
  runApp(const ZenLeaderApp());
}

class ZenLeaderApp extends StatelessWidget {
  const ZenLeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zen Leader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryBlue,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
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
    ExploreScreen(),
    ForumScreen(),
    LeaderboardScreen(),
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
            BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Học'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: 'Khám phá'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.users), label: 'Cộng đồng'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.trophy), label: 'Bảng xếp hạng'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Hồ sơ'),
          ],
        ),
      ),
    );
  }
}
