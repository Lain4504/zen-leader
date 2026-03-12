import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/course_detail_path_screen.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  bool _isOngoing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("KHÓA HỌC CỦA TÔI", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Đang học", _isOngoing, () => setState(() => _isOngoing = true)),
                const SizedBox(width: 16),
                _buildToggleButton("Hoàn thành", !_isOngoing, () => setState(() => _isOngoing = false)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _isOngoing ? 2 : 1,
              itemBuilder: (context, index) {
                return _buildCourseProgressCard(
                  context,
                  title: _isOngoing 
                    ? (index == 0 ? "Zen Leader 1: Làm Chủ Bản Thân" : "Quản Trị Năng Lượng")
                    : "Lãnh Đạo Đội Nhóm Cơ Bản",
                  progress: _isOngoing ? (index == 0 ? 0.65 : 0.4) : 1.0,
                  sessions: _isOngoing ? (index == 0 ? "8/12" : "3/10") : "10/10",
                  isCompleted: !_isOngoing,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.accentDark,
          ),
        ),
      ),
    );
  }

  Widget _buildCourseProgressCard(
    BuildContext context, {
    required String title,
    required double progress,
    required String sessions,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseDetailPathScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(LucideIcons.bookOpen, color: AppColors.primaryBlue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.accentDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$sessions bài học",
                        style: GoogleFonts.nunito(fontSize: 12, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    lineHeight: 10,
                    percent: progress,
                    progressColor: AppColors.progressGreen,
                    backgroundColor: Colors.grey.shade100,
                    barRadius: const Radius.circular(5),
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CourseDetailPathScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCompleted ? Colors.white : AppColors.primaryBlue,
                  foregroundColor: isCompleted ? AppColors.primaryBlue : Colors.white,
                  elevation: 0,
                  side: isCompleted ? const BorderSide(color: AppColors.primaryBlue) : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  isCompleted ? "XEM LẠI" : "TIẾP TỤC HỌC",
                  style: GoogleFonts.fredoka(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
