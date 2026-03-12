import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                   Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.teal, width: 4),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=zen'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Nguyễn Tâm",
              style: GoogleFonts.fredoka(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.accentDark,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "BẬC THẦY TỈNH THỨC",
                style: GoogleFonts.fredoka(
                  color: AppColors.teal,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCoursesScreen()),
                    );
                  },
                  icon: const Icon(LucideIcons.bookOpen, size: 18),
                  label: Text("KHÓA HỌC CỦA TÔI", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryBlue,
                    elevation: 0,
                    side: const BorderSide(color: AppColors.primaryBlue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildStatCard(LucideIcons.flame, "12", "Ngày chuỗi", Colors.orange),
                  const SizedBox(width: 16),
                  _buildStatCard(LucideIcons.star, "1450", "Zen XP", Colors.amber),
                  const SizedBox(width: 16),
                  _buildStatCard(LucideIcons.trophy, "#5", "Xếp hạng", AppColors.primaryBlue),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "THÀNH TỰU",
                    style: GoogleFonts.fredoka(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      _buildAchievement(LucideIcons.flower, "Khai mở", true),
                      _buildAchievement(LucideIcons.zap, "Năng lượng", true),
                      _buildAchievement(LucideIcons.compass, "Bản lĩnh", true),
                      _buildAchievement(LucideIcons.moon, "Tĩnh lặng", false),
                      _buildAchievement(LucideIcons.sun, "Sáng suốt", false),
                      _buildAchievement(LucideIcons.mountain, "Kiên định", false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.fredoka(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.accentDark,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 10,
                color: AppColors.textMuted,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievement(IconData icon, String label, bool isUnlocked) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isUnlocked ? AppColors.primaryBlue.withOpacity(0.1) : Colors.grey.shade100,
          ),
          child: Icon(
            icon,
            color: isUnlocked ? AppColors.primaryBlue : Colors.grey.shade400,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 12,
            fontWeight: isUnlocked ? FontWeight.bold : FontWeight.normal,
            color: isUnlocked ? AppColors.accentDark : Colors.grey,
          ),
        ),
      ],
    );
  }
}
