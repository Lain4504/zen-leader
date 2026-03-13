import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  const Icon(Icons.play_circle_fill, color: Colors.white, size: 80),
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
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 28),
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
          const Icon(Icons.more_vert, color: Colors.white),
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
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 20),
                onPressed: () => setState(() => _isPlaying = !_isPlaying),
              ),
              const SizedBox(width: 8),
              Text("03:45 / 15:20", style: GoogleFonts.nunito(color: Colors.white, fontSize: 12)),
              const Spacer(),
              const Icon(Icons.settings_outlined, color: Colors.white, size: 18),
              const SizedBox(width: 16),
              const Icon(Icons.fullscreen, color: Colors.white, size: 18),
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
                    "PLAYING",
                    style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.download_outlined, color: Colors.grey, size: 20),
                const SizedBox(width: 16),
                const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
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
                const CircleAvatar(radius: 12, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 14, color: Colors.white)),
                const SizedBox(width: 8),
                Text("Instructor", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text("1.5k views", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Lesson notes",
              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.accentDark),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "In this lesson you'll learn to identify barriers to listening. Listening is not only with the ears but with the heart and full presence...",
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
              child: Text("COMPLETE LESSON", style: GoogleFonts.fredoka(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
