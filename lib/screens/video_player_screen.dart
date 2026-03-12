import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/day_completed_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  const VideoPlayerScreen({super.key, required this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool _isPlaying = true;
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Video Content
          Center(
            child: Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade900,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(LucideIcons.playCircle, color: Colors.white, size: 80),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildVideoControls(),
                  ),
                ],
              ),
            ),
          ),
          
          _buildOverlayHeader(context),
          
          _buildInfoPanel(context),
        ],
      ),
    );
  }

  Widget _buildOverlayHeader(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(LucideIcons.chevronLeft, color: Colors.white, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.title,
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(LucideIcons.moreVertical, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildVideoControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              activeTrackColor: AppColors.primaryBlue,
              inactiveTrackColor: Colors.white24,
              thumbColor: AppColors.primaryBlue,
            ),
            child: Slider(
              value: _progress,
              onChanged: (v) => setState(() => _progress = v),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(_isPlaying ? LucideIcons.pause : LucideIcons.play, color: Colors.white, size: 20),
                onPressed: () => setState(() => _isPlaying = !_isPlaying),
              ),
              const SizedBox(width: 8),
              Text("03:45 / 15:20", style: GoogleFonts.nunito(color: Colors.white, fontSize: 12)),
              const Spacer(),
              const Icon(LucideIcons.settings, color: Colors.white, size: 18),
              const SizedBox(width: 16),
              const Icon(LucideIcons.maximize, color: Colors.white, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPanel(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "ĐANG PHÁT",
                    style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                const Icon(LucideIcons.downloadCloud, color: Colors.grey, size: 20),
                const SizedBox(width: 16),
                const Icon(LucideIcons.heart, color: Colors.grey, size: 20),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: GoogleFonts.fredoka(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.accentDark),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(radius: 12, backgroundColor: Colors.grey, child: Icon(LucideIcons.user, size: 14, color: Colors.white)),
                const SizedBox(width: 8),
                Text("Thầy Minh Niệm", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text("1.5k lượt xem", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Ghi chú bài học",
              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.accentDark),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "Trong bài học này, Thầy Minh Niệm sẽ hướng dẫn cách nhận diện những rào cản trong việc lắng nghe. Lắng nghe không chỉ bằng đôi tai, mà còn bằng cả trái tim và sự hiện diện trọn vẹn của chúng ta...",
                  style: GoogleFonts.nunito(color: Colors.grey, height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DayCompletedScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text("HOÀN THÀNH BÀI HỌC", style: GoogleFonts.fredoka(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
