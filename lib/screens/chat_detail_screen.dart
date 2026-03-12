import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accentDark),
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(radius: 18, backgroundColor: Colors.grey),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Thầy Minh Niệm", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.accentDark)),
                Text("Đang trực tuyến", style: GoogleFonts.nunito(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildMessage(
                  "Chào Thầy, con có một thắc mắc về bài giảng sáng nay ạ.",
                  true,
                  "10:00 AM",
                ),
                _buildMessage(
                  "Chào con, con cứ nói nhé. Thầy đang nghe đây.",
                  false,
                  "10:05 AM",
                ),
                _buildSharedLessonCard(),
                _buildMessage(
                  "Con đã xem lại bài 'Thiền định cơ bản' như Thầy dặn chưa?",
                  false,
                  "10:10 AM",
                ),
              ],
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        constraints: const BoxConstraints(maxWidth: 280),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isMe ? 20 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 20),
          ),
          boxShadow: [
            if (!isMe)
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.nunito(
                color: isMe ? Colors.white : AppColors.accentDark,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: GoogleFonts.nunito(
                color: isMe ? Colors.white70 : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedLessonCard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryBlue.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(child: Icon(LucideIcons.playCircle, size: 40, color: AppColors.primaryBlue)),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("BÀI HỌC CHIA SẺ", style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Thiền định cơ bản cho người mới", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      minimumSize: const Size(double.infinity, 32),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: Text("Xem ngay", style: GoogleFonts.fredoka(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 40),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            const Icon(LucideIcons.plusCircle, color: Colors.grey),
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
                    hintText: "Nhập tin nhắn...",
                    hintStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(LucideIcons.mic, color: Colors.grey),
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
