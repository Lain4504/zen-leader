import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/live_meeting_screen.dart';

class SeminarDetailScreen extends StatelessWidget {
  const SeminarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBanner(context),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unlock your leadership potential",
                        style: GoogleFonts.nunito(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: AppColors.accentDark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInstructorSection(),
                      const SizedBox(height: 32),
                      _buildInfoRow(),
                      const SizedBox(height: 32),
                      _buildDescription(),
                      const SizedBox(height: 32),
                      _buildTopicsSection(),
                      const SizedBox(height: 120), // Spacing for sticky button
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStickyCTA(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1518196775791-2e12d3fbc1d4?auto=format&fit=crop&w=800&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.accentDark),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInstructorSection() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=minhniem'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instructor",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.accentDark,
              ),
            ),
            Text(
              "Author of 'Understanding the Heart', psychologist",
              style: GoogleFonts.nunito(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(Icons.calendar_month, "25/12/2023"),
          _buildInfoItem(Icons.schedule, "15:00 - 17:00"),
          _buildInfoItem(Icons.people_alt_outlined, "450+ learners"),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryBlue, size: 20),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SEMINAR OVERVIEW",
          style: GoogleFonts.fredoka(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "This seminar focuses on awakening your inner leadership through meditation and self-observation. You'll get practical tools to stay grounded in fast-changing business environments.",
          style: GoogleFonts.nunito(
            fontSize: 16,
            height: 1.6,
            color: AppColors.accentDark,
          ),
        ),
      ],
    );
  }

  Widget _buildTopicsSection() {
    final topics = [
      "Self-understanding through observation",
      "Emotional management in negotiation",
      "Building a mindful culture at work",
      "Applied meditation techniques for leaders"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MAIN TOPICS",
          style: GoogleFonts.fredoka(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        ...topics.map((t) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: AppColors.teal, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: AppColors.accentDark,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildStickyCTA(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LiveMeetingScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: Text(
            "JOIN SEMINAR",
            style: GoogleFonts.fredoka(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
