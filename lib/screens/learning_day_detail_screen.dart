import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/live_meeting_screen.dart';

class LearningDayDetailScreen extends StatelessWidget {
  const LearningDayDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.accentDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "NGÀY 5: GIAO TIẾP TỈNH THỨC",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.accentDark),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildDayProgress(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildLiveSessionCard(context),
                const SizedBox(height: 24),
                _buildSectionHeader("NỘI DUNG HỌC TẬP"),
                const SizedBox(height: 16),
                _buildMaterialCard(
                  title: "Video: Nguyên lý lắng nghe",
                  duration: "15 phút",
                  icon: LucideIcons.playCircle,
                  status: MaterialStatus.completed,
                ),
                _buildMaterialCard(
                  title: "Tài liệu: Thực hành sâu",
                  duration: "10 phút",
                  icon: LucideIcons.fileText,
                  status: MaterialStatus.available,
                ),
                _buildMaterialCard(
                  title: "Bài tập: Rèn luyện tâm trí",
                  duration: "20 phút",
                  icon: LucideIcons.edit3,
                  status: MaterialStatus.available,
                ),
                _buildMaterialCard(
                  title: "Luyện tập: Quiz kiến thức",
                  duration: "5 phút",
                  icon: LucideIcons.helpCircle,
                  status: MaterialStatus.available,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayProgress() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tiến độ hoàn thành",
                style: GoogleFonts.nunito(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                "60%",
                style: GoogleFonts.fredoka(color: AppColors.progressGreen, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.6,
              minHeight: 8,
              backgroundColor: AppColors.background,
              color: AppColors.progressGreen,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveSessionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.primaryBlue.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.primaryBlue.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "LIVE",
                  style: GoogleFonts.fredoka(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              const Icon(LucideIcons.video, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Lớp học trực tuyến live",
            style: GoogleFonts.fredoka(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(radius: 12, backgroundColor: Colors.white24, child: Icon(LucideIcons.user, size: 14, color: Colors.white)),
              const SizedBox(width: 8),
              Text("Thầy Minh Niệm", style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text("45 phút", style: GoogleFonts.nunito(color: Colors.white70, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveMeetingScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: Text(
              "THAM GIA NGAY",
              style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.fredoka(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textMuted),
    );
  }

  Widget _buildMaterialCard({
    required String title,
    required String duration,
    required IconData icon,
    required MaterialStatus status,
  }) {
    bool isCompleted = status == MaterialStatus.completed;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.progressGreen.withOpacity(0.1) : AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isCompleted ? AppColors.progressGreen : AppColors.primaryBlue, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  duration,
                  style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isCompleted)
            const Icon(LucideIcons.checkCircle, color: AppColors.progressGreen, size: 24)
          else
            const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}

enum MaterialStatus { available, completed, locked }
