import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Daily Practice", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes, size: 80, color: AppColors.primaryBlue),
            const SizedBox(height: 24),
            Text(
              "Coming Soon",
              style: GoogleFonts.fredoka(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.accentDark),
            ),
            const SizedBox(height: 12),
            Text(
              "Internal practicing and meditation module.",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
