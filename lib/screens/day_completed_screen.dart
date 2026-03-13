import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';

class DayCompletedScreen extends StatelessWidget {
  const DayCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background soft confetti effect (simulated with dots if no lottie)
          ...List.generate(20, (index) => _buildConfettiDot(index)),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  _buildTrophyIcon(),
                  const SizedBox(height: 40),
                  Text(
                    "Great job!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fredoka(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentDark,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 12),
                  Text(
                    "Congratulations on completing Day 5",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                  const SizedBox(height: 48),
                  _buildRewardsSection(),
                  const SizedBox(height: 48),
                  Text(
                    "\"Your calm is your strength\"",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: AppColors.primaryBlue,
                    ),
                  ).animate().fadeIn(delay: 800.ms, duration: 1000.ms),
                  const Spacer(),
                  _buildContinueButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrophyIcon() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
          ).animate(onPlay: (c) => c.repeat())
            .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 2000.ms)
            .fadeOut(duration: 2000.ms),
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10)),
              ],
            ),
            child: const Icon(LucideIcons.award, size: 60, color: Colors.amber),
          ).animate().scale(duration: 800.ms, curve: Curves.elasticOut),
        ],
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRewardCard("+100 XP", LucideIcons.zap, Colors.amber),
        const SizedBox(width: 20),
        _buildRewardCard("+1 Ngày", LucideIcons.flame, Colors.orange),
      ],
    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildRewardCard(String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.fredoka(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
      ),
      child: Text(
        "CONTINUE JOURNEY",
        style: GoogleFonts.fredoka(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ).animate().fadeIn(delay: 1000.ms);
  }

  Widget _buildConfettiDot(int index) {
    final left = (index * 50.0) % 400.0;
    final top = (index * 80.0) % 800.0;
    final color = [Colors.blue, Colors.green, Colors.orange, Colors.pink][index % 4];

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: color.withOpacity(0.3), shape: BoxShape.circle),
      ).animate(onPlay: (c) => c.repeat())
       .moveY(begin: 0, end: 100, duration: (2000 + index * 100).ms)
       .fadeOut(duration: (2000 + index * 100).ms),
    );
  }
}
