import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/seminar_detail_screen.dart';

class JoinSeminarScreen extends StatelessWidget {
  const JoinSeminarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("THAM GIA HỘI THẢO", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildSeminarCard(
                  context,
                  title: "Khai phóng tiềm năng lãnh đạo",
                  instructor: "Thầy Minh Niệm",
                  participants: "450+",
                  status: "LIVE",
                  category: "Lãnh đạo",
                  color: AppColors.primaryBlue,
                ),
                _buildSeminarCard(
                  context,
                  title: "Thấu hiểu nội tâm - Quản trị cuộc đời",
                  instructor: "Trương Nguyện Thành",
                  participants: "230",
                  status: "Upcoming",
                  category: "Tâm lý",
                  color: AppColors.teal,
                ),
                _buildSeminarCard(
                  context,
                  title: "Xây dựng đội ngũ kế thừa",
                  instructor: "Coach Duy Khanh",
                  participants: "120",
                  status: "Upcoming",
                  category: "Quản trị",
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Tìm chủ đề hoặc diễn giả...",
                  hintStyle: GoogleFonts.nunito(color: Colors.grey),
                  border: InputBorder.none,
                  icon: const Icon(LucideIcons.search, color: Colors.grey, size: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _buildFilterChip("Tất cả", true),
                _buildFilterChip("Hôm nay", false),
                _buildFilterChip("Miễn phí", false),
                _buildFilterChip("Phổ biến", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.primaryBlue : Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          color: isSelected ? Colors.white : AppColors.accentDark,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildSeminarCard(
    BuildContext context, {
    required String title,
    required String instructor,
    required String participants,
    required String status,
    required String category,
    required Color color,
  }) {
    bool isLive = status == "LIVE";
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SeminarDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/logo-zenleader.webp',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isLive ? Colors.red : AppColors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isLive ? "TRỰC TIẾP" : "Sắp diễn ra",
                      style: GoogleFonts.fredoka(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(LucideIcons.users, color: Colors.white, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          participants,
                          style: GoogleFonts.nunito(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: GoogleFonts.fredoka(
                      color: AppColors.primaryBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        instructor,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SeminarDetailScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLive ? AppColors.primaryBlue : Colors.white,
                          foregroundColor: isLive ? Colors.white : AppColors.primaryBlue,
                          elevation: 0,
                          side: isLive ? null : const BorderSide(color: AppColors.primaryBlue),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text(
                          isLive ? "Tham gia" : "Đăng ký",
                          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
