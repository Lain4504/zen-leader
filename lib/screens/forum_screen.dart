import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("CỘNG ĐỒNG ZEN", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryTile(
              LucideIcons.messageSquare,
              "Chia sẻ kinh nghiệm",
              "125 bài viết • 45 đang trực tuyến",
              AppColors.primaryBlue,
            ),
            _buildCategoryTile(
              LucideIcons.helpCircle,
              "Hỏi đáp kỹ thuật",
              "82 bài viết • 12 đang trực tuyến",
              AppColors.teal,
            ),
            _buildCategoryTile(
              LucideIcons.calendar,
              "Lịch Retreat & Sự kiện",
              "12 bài tập • 5 sắp diễn ra",
              Colors.orange,
            ),
            const SizedBox(height: 32),
            Text(
              "THẢO LUẬN MỚI NHẤT",
              style: GoogleFonts.fredoka(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.accentDark,
              ),
            ),
            const SizedBox(height: 16),
            _buildThreadCard(
              context,
              author: "Lâm Vũ",
              title: "Lợi ích của việc thiền 10 phút mỗi sáng trước khi đi làm",
              time: "2 giờ trước",
              likes: 42,
              comments: 12,
            ),
            _buildThreadCard(
              context,
              author: "Minh Thu",
              title: "Làm thế nào để giữ bình tĩnh khi đối mặt với deadline?",
              time: "5 giờ trước",
              likes: 18,
              comments: 8,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(LucideIcons.plus, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryTile(IconData icon, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
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
                Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildThreadCard(
    BuildContext context, {
    required String author,
    required String title,
    required String time,
    required int likes,
    required int comments,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForumThreadScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
                ),
                const SizedBox(width: 8),
                Text(
                  author,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textMuted,
                  ),
                ),
                const Spacer(),
                Text(
                  time,
                  style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.accentDark,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(LucideIcons.thumbsUp, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text("$likes", style: GoogleFonts.nunito(color: Colors.grey)),
                const SizedBox(width: 16),
                const Icon(LucideIcons.messageCircle, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text("$comments", style: GoogleFonts.nunito(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForumThreadScreen extends StatelessWidget {
  const ForumThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accentDark),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lâm Vũ", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("2 giờ trước • 1.2k lượt xem", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Lợi ích của việc thiền 10 phút mỗi sáng trước khi đi làm",
              style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.accentDark),
            ),
            const SizedBox(height: 16),
            Text(
              "Chào mọi người, tuần vừa qua mình đã thử áp dụng việc ngồi tĩnh tâm 10 phút trước khi bắt đầu check email hay làm việc. Kết quả thật bất ngờ, mình cảm thấy áp lực trong công việc giảm đi đáng kể...",
              style: GoogleFonts.nunito(fontSize: 16, height: 1.6, color: AppColors.accentDark),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text("BÌNH LUẬN (12)", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.textMuted)),
            const SizedBox(height: 24),
            _buildComment("Hưng Đặng", "Rất đồng ý với bạn! Mình cũng đã duy trì được 1 tháng rồi."),
            _buildComment("Thùy Linh", "Cho mình hỏi bạn thường thiền lúc mấy giờ?"),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String user, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade200),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user, style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(text, style: GoogleFonts.nunito(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
