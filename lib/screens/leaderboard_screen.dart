import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("LEADERBOARD", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildPremiumPodium(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: 47, // From 4 to 50
              itemBuilder: (context, index) {
                return _buildPremiumRankCard(index + 4);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumPodium() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodiumIcon("Alex", "2,450 XP", "2", 80),
          _buildPodiumIcon("Jordan", "3,120 XP", "1", 110, isFirst: true),
          _buildPodiumIcon("Sam", "2,100 XP", "3", 80),
        ],
      ),
    );
  }

  Widget _buildPodiumIcon(String name, String xp, String rank, double height, {bool isFirst = false}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                radius: isFirst ? 45 : 35,
                backgroundColor: AppColors.background,
                child: Icon(Icons.person, size: isFirst ? 40 : 30, color: Colors.grey),
              ),
            ),
            if (isFirst)
              const Positioned(
                top: 0,
                child: Icon(Icons.emoji_events, color: Colors.amber, size: 28),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(name, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: isFirst ? 16 : 14)),
        Text(xp, style: GoogleFonts.nunito(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        Container(
          width: 70,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isFirst 
                  ? [AppColors.primaryBlue, AppColors.primaryBlue.withOpacity(0.6)]
                  : [Colors.grey.shade200, Colors.grey.shade100],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              rank,
              style: GoogleFonts.fredoka(
                color: isFirst ? Colors.white : Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumRankCard(int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              "$rank",
              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.background,
            child: Icon(Icons.person, size: 18, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User $rank", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey.shade100,
                    color: AppColors.primaryBlue,
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            "${1000 - rank * 10} XP",
            style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.accentDark, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
