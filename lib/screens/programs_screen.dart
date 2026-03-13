import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/zen_leader_pathway_screen.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Programs",
          style: GoogleFonts.fredoka(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.accentDark,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.search, color: AppColors.primaryBlue),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildProgramCard(
              context,
              title: "Zen Leader Program",
              description: "Transform your leadership from the inside out",
              imageUrl: "https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
              progress: 0.4,
              level: "Level 5/20",
              accentColor: AppColors.primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ZenLeaderPathwayScreen()),
                );
              },
            ),
            const SizedBox(height: 24),
            _buildProgramCard(
              context,
              title: "HEAL Program",
              description: "Healthy Embodied Agile Leadership for healthcare",
              imageUrl: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
              progress: 0.1,
              level: "Level 2/15",
              accentColor: AppColors.teal,
            ),
            const SizedBox(height: 24),
            _buildProgramCard(
              context,
              title: "FEBI-4U",
              description: "Discover your energy patterns and personality",
              imageUrl: "https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
              progress: 0.05,
              level: "Level 1/10",
              accentColor: Colors.orange,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imageUrl,
    required double progress,
    required String level,
    required Color accentColor,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      level,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.fredoka(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        lineHeight: 12.0,
                        percent: progress,
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.background,
                        progressColor: AppColors.progressGreen,
                        barRadius: const Radius.circular(10),
                        animation: true,
                        animationDuration: 1000,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: AppColors.progressGreen,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onTap ?? () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.progressGreen,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "BẮT ĐẦU CHƯƠNG TRÌNH",
                      style: GoogleFonts.fredoka(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ).animate()
                 .scale(delay: 500.ms, duration: 300.ms, curve: Curves.easeOutBack),
              ],
            ),
          ),
        ],
      ),
    ).animate()
     .fadeIn(duration: 600.ms)
     .slideY(begin: 0.1, end: 0, curve: Curves.easeOutCubic);
  }
}
