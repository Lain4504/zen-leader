import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LiveMeetingScreen extends StatefulWidget {
  const LiveMeetingScreen({super.key});

  @override
  State<LiveMeetingScreen> createState() => _LiveMeetingScreenState();
}

class _LiveMeetingScreenState extends State<LiveMeetingScreen> {
  bool _isMuted = false;
  bool _isCameraOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main Video Feed
          _buildVideoFeed(),
          
          // Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopBar(context),
          ),
          
          // Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomControls(context),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoFeed() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.accentDark,
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1499209974431-9dac3adaf471?auto=format&fit=crop&w=800&q=80'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Self Preview
          Positioned(
            top: 100,
            right: 20,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white24),
              ),
              child: _isCameraOff 
                ? const Center(child: Icon(Icons.videocam_off, color: Colors.white, size: 24))
                : const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Center(child: Icon(Icons.person, color: Colors.white38, size: 40)),
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Row(
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
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Unlock your leadership potential",
              style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.people_alt_outlined, color: Colors.white70, size: 16),
          const SizedBox(width: 4),
          Text("456", style: GoogleFonts.nunito(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildControlButton(
            _isMuted ? Icons.mic_off : Icons.mic,
            _isMuted ? Colors.red : Colors.white24,
            () => setState(() => _isMuted = !_isMuted),
          ),
          _buildControlButton(
            _isCameraOff ? Icons.videocam_off : Icons.videocam,
            _isCameraOff ? Colors.red : Colors.white24,
            () => setState(() => _isCameraOff = !_isCameraOff),
          ),
          _buildControlButton(Icons.back_hand_outlined, Colors.white24, () {}),
          _buildControlButton(Icons.chat_bubble_outline, Colors.white24, () => _showChat(context)),
          _buildControlButton(Icons.logout, Colors.red.withOpacity(0.8), () => Navigator.pop(context)),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  void _showChat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text("CONVERSATION", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        _buildChatItem("Student A", "How can I reduce anxiety?"),
                        _buildChatItem("Student B", "Great session!"),
                        _buildChatItem("Student C", "Thank you and the team."),
                      ],
                    ),
                  ),
                  _buildChatInput(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildChatItem(String name, String msg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primaryBlue)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: Text(msg, style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Type a message...", border: InputBorder.none, hintStyle: GoogleFonts.nunito(fontSize: 14)),
            ),
          ),
          const Icon(Icons.send, color: AppColors.primaryBlue, size: 20),
        ],
      ),
    );
  }
}
