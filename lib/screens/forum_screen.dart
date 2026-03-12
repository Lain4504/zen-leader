import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/create_post_screen.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    "Thảo luận chung",
    "Câu hỏi khóa học",
    "Mẹo học tập",
    "Sự nghiệp",
    "Thông báo"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("CỘNG ĐỒNG ZEN", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.search, color: AppColors.accentDark),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildPostCard(
                  context,
                  author: "Lâm Vũ",
                  time: "2 giờ trước",
                  title: "Làm thế nào để duy trì thói quen thiền định khi bận rộn?",
                  preview: "Mình thấy rất khó để dành ra 15 phút mỗi sáng khi deadline dồn dập. Mọi người có mẹo nào không?",
                  tag: "Mẹo học tập",
                  replies: 24,
                  likes: 56,
                ),
                _buildPostCard(
                  context,
                  author: "Minh Thu",
                  time: "5 giờ trước",
                  title: "Review khóa học 'Quản trị năng lượng đỉnh cao'",
                  preview: "Sau 1 tuần áp dụng các kỹ thuật trong khóa học, mình cảm thấy tỉnh táo hơn hẳn vào buổi chiều...",
                  tag: "Thảo luận",
                  replies: 12,
                  likes: 89,
                ),
                _buildPostCard(
                  context,
                  author: "Hoàng Nam",
                  time: "Hôm qua",
                  title: "Xin tài liệu về lãnh đạo từ tâm bằng tiếng Anh",
                  preview: "Chào mọi người, mình đang tìm một số đầu sách tiếng Anh để nghiên cứu thêm về chủ đề này.",
                  tag: "Câu hỏi",
                  replies: 5,
                  likes: 12,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
        },
        backgroundColor: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(LucideIcons.penTool, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: List.generate(_categories.length, (index) {
            bool isSelected = _selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategoryIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _categories[index],
                  style: GoogleFonts.nunito(
                    color: isSelected ? Colors.white : AppColors.textMuted,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context, {
    required String author,
    required String time,
    required String title,
    required String preview,
    required String tag,
    required int replies,
    required int likes,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForumThreadScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 14, backgroundColor: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  author,
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const Spacer(),
                Text(
                  time,
                  style: GoogleFonts.nunito(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.accentDark,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              preview,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: AppColors.textMuted,
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.fredoka(
                      color: AppColors.primaryBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(LucideIcons.messageCircle, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text("$replies", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
                const SizedBox(width: 16),
                const Icon(LucideIcons.thumbsUp, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text("$likes", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accentDark),
        title: Text("THẢO LUẬN", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildThreadHeader(),
                const SizedBox(height: 24),
                _buildThreadContent(),
                const SizedBox(height: 24),
                _buildCourseReference(),
                const SizedBox(height: 32),
                Text(
                  "BÌNH LUẬN (24)",
                  style: GoogleFonts.fredoka(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 16),
                _buildReplyItem("Hưng Đặng", "Rất đồng ý với bạn! Mình cũng đã duy trì được 1 tháng rồi.", "1 giờ trước"),
                _buildReplyItem("Thùy Linh", "Cho mình hỏi bạn thường thiền lúc mấy giờ để hiệu quả nhất?", "30 phút trước"),
                const SizedBox(height: 100), // Spacing for input
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildReplyInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildThreadHeader() {
    return Row(
      children: [
        const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lâm Vũ", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 15)),
            Text("2 giờ trước • 1.2k lượt xem", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _buildThreadContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lợi ích của việc thiền 10 phút mỗi sáng trước khi đi làm",
          style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.accentDark),
        ),
        const SizedBox(height: 16),
        Text(
          "Chào mọi người, tuần vừa qua mình đã thử áp dụng việc ngồi tĩnh tâm 10 phút trước khi bắt đầu check email hay làm việc. Kết quả thật bất ngờ, mình cảm thấy áp lực trong công việc giảm đi đáng kể. Tâm trí dường như sáng suốt hơn để đưa ra các quyết định quan trọng.",
          style: GoogleFonts.nunito(fontSize: 16, height: 1.6, color: AppColors.accentDark),
        ),
      ],
    );
  }

  Widget _buildCourseReference() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(LucideIcons.bookOpen, color: AppColors.primaryBlue, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Khóa học liên quan",
                  style: GoogleFonts.nunito(fontSize: 11, color: AppColors.textMuted),
                ),
                Text(
                  "Thiền định & Lãnh đạo bản thân",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildReplyItem(String user, String text, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
              const SizedBox(width: 8),
              Text(user, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 13)),
              const Spacer(),
              Text(time, style: GoogleFonts.nunito(color: Colors.grey, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, style: GoogleFonts.nunito(fontSize: 14, height: 1.5)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(LucideIcons.thumbsUp, size: 14, color: AppColors.primaryBlue),
              const SizedBox(width: 4),
              Text("Đồng ý", style: GoogleFonts.nunito(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(width: 24),
              const Icon(LucideIcons.reply, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text("Trả lời", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReplyInput() {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            const Icon(LucideIcons.paperclip, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Viết bình luận...",
                    hintStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(LucideIcons.send, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
