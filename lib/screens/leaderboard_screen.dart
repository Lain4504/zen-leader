import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.accentDark, AppColors.primaryBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Column(
              children: [
                Text(
                  "BẢNG XẾP HẠNG",
                  style: GoogleFonts.fredoka(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildPodium(
                      "Trần An",
                      "1,150 XP",
                      "https://i.pravatar.cc/150?u=2",
                      2,
                      80,
                    ),
                    _buildPodium(
                      "Hoàng Nam",
                      "1,450 XP",
                      "https://i.pravatar.cc/150?u=1",
                      1,
                      100,
                    ),
                    _buildPodium(
                      "Linh Chi",
                      "1,050 XP",
                      "https://i.pravatar.cc/150?u=3",
                      3,
                      70,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              itemCount: 10,
              itemBuilder: (context, index) {
                int rank = index + 4;
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        "$rank",
                        style: GoogleFonts.fredoka(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 16),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=user$rank'),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Học viên $rank",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentDark,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${1000 - (index * 50)} XP",
                        style: GoogleFonts.fredoka(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodium(String name, String xp, String imageUrl, int rank, double height) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: rank == 1 ? Colors.amber : (rank == 2 ? Colors.grey : Colors.brown),
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: rank == 1 ? 40 : 30,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            if (rank == 1)
              const Icon(LucideIcons.crown, color: Colors.amber, size: 24),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          xp,
          style: GoogleFonts.fredoka(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
