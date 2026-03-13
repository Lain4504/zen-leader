import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    "General discussion",
    "Course questions",
    "Study tips",
    "Career",
    "Announcements"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("ZEN COMMUNITY", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.accentDark),
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
                  author: "Alex",
                  time: "2 hours ago",
                  title: "How do you keep a meditation habit when busy?",
                  preview: "I find it hard to spare 15 minutes each morning when deadlines pile up. Any tips?",
                  tag: "Study tips",
                  replies: 24,
                  likes: 56,
                ),
                _buildPostCard(
                  context,
                  author: "Sam",
                  time: "5 hours ago",
                  title: "Review: Peak Energy Management course",
                  preview: "After a week of applying the techniques, I feel much more alert in the afternoon...",
                  tag: "Discussion",
                  replies: 12,
                  likes: 89,
                ),
                _buildPostCard(
                  context,
                  author: "Jordan",
                  time: "Yesterday",
                  title: "Looking for English resources on heart-centered leadership",
                  preview: "Hi everyone, I'm looking for some English books on this topic.",
                  tag: "Question",
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
        child: const Icon(Icons.edit, color: Colors.white),
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
                const Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text("$replies", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
                const SizedBox(width: 16),
                const Icon(Icons.thumb_up_off_alt, size: 14, color: Colors.grey),
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
        title: Text("DISCUSSION", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
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
                  "COMMENTS (24)",
                  style: GoogleFonts.fredoka(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 16),
                _buildReplyItem("Alex", "I agree! I've kept it up for a month now.", "1 hour ago"),
                _buildReplyItem("Sam", "What time do you usually meditate for best results?", "30 min ago"),
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
            Text("Alex", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 15)),
            Text("2 hours ago • 1.2k views", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
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
          "Benefits of 10 minutes of morning meditation before work",
          style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.accentDark),
        ),
        const SizedBox(height: 16),
        Text(
          "Hi everyone, last week I tried sitting for 10 minutes before checking email or starting work. The result was surprising – I felt less pressure and my mind was clearer for important decisions.",
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
            child: const Icon(Icons.menu_book_outlined, color: AppColors.primaryBlue, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Related course",
                  style: GoogleFonts.nunito(fontSize: 11, color: AppColors.textMuted),
                ),
                Text(
                  "Meditation & Self leadership",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
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
              const Icon(Icons.thumb_up, size: 14, color: AppColors.primaryBlue),
              const SizedBox(width: 4),
              Text("Like", style: GoogleFonts.nunito(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(width: 24),
              const Icon(Icons.reply, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text("Reply", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
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
            const Icon(Icons.attach_file, color: Colors.grey),
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
                    hintText: "Write a comment...",
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
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
