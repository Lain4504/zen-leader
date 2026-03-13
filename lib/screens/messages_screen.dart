import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/chat_detail_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MESSAGES", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.edit, color: AppColors.primaryBlue),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search conversations...",
                  hintStyle: GoogleFonts.nunito(color: Colors.grey),
                  border: InputBorder.none,
                  icon: const Icon(LucideIcons.search, color: Colors.grey, size: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem(
                  context,
                  name: "Instructor",
                  msg: "Thank you, keep up the practice.",
                  time: "10:15 AM",
                  status: "Instructor",
                  unread: 2,
                ),
                _buildChatItem(
                  context,
                  name: "Master 1 Group",
                  msg: "When is everyone meditating tomorrow?",
                  time: "8:30 AM",
                  status: "Group",
                  unread: 0,
                ),
                _buildChatItem(
                  context,
                  name: "Mentor",
                  msg: "I've received your assignment.",
                  time: "Yesterday",
                  status: "Mentor",
                  unread: 0,
                ),
                _buildChatItem(
                  context,
                  name: "Peer",
                  msg: "Are you online?",
                  time: "2 days ago",
                  status: "Peer",
                  unread: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context, {
    required String name,
    required String msg,
    required String time,
    required String status,
    required int unread,
  }) {
    Color statusColor = status == "Instructor" 
        ? AppColors.teal 
        : (status == "Mentor" ? AppColors.primaryBlue : Colors.grey);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatDetailScreen()),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: const CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.background,
        child: Icon(LucideIcons.user, color: Colors.grey),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: GoogleFonts.fredoka(color: statusColor, fontSize: 8, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          msg,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: unread > 0 ? AppColors.accentDark : Colors.grey,
            fontWeight: unread > 0 ? FontWeight.bold : FontWeight.normal,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: GoogleFonts.nunito(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 4),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$unread",
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
