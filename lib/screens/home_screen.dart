import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/article_detail_screen.dart';
import 'package:zen_leader/screens/learning_day_detail_screen.dart';
import 'package:zen_leader/screens/zen_leader_pathway_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildContinueLearning(context),
              const SizedBox(height: 32),
              _buildUpcomingEvents(),
              const SizedBox(height: 32),
              _buildInsights(context),
              const SizedBox(height: 32),
              _buildDailyPractice(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                child: const Icon(Icons.person, color: AppColors.primaryBlue),
              ),
              const Spacer(),
              _buildStatChip(Icons.local_fire_department, "12", Colors.orange),
              const SizedBox(width: 8),
              _buildStatChip(Icons.star, "1450", Colors.amber),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Welcome back,",
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: AppColors.textMuted,
            ),
          ),
          Text(
            "continue your leadership journey",
            style: GoogleFonts.fredoka(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            value,
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramJourney(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Your Leadership Pathway",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildPathNode("FEBI-4U", Icons.bolt, true, false),
              _buildPathConnector(true),
              _buildPathNode("ZL 1", Icons.spa, false, true),
              _buildPathConnector(false),
              _buildPathNode("ZL 2", Icons.terrain, false, false),
              _buildPathConnector(false),
              _buildPathNode("ZL 3", Icons.explore, false, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPathNode(String label, IconData icon, bool done, bool active) {
    Color color = done ? AppColors.progressGreen : (active ? AppColors.primaryBlue : Colors.grey.shade300);
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              if (active)
                BoxShadow(color: color.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
            ],
          ),
          child: Icon(
            done ? Icons.check : (active ? icon : Icons.lock),
            color: Colors.white,
            size: 28,
          ),
        ).animate(autoPlay: active).shimmer(duration: 2.seconds, color: Colors.white.withOpacity(0.2)),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildPathConnector(bool active) {
    return Container(
      width: 40,
      height: 65,
      alignment: Alignment.center,
      child: Container(
        height: 4,
        width: 30,
        decoration: BoxDecoration(
          color: active ? AppColors.progressGreen : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildContinueLearning(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Continue Learning",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildCourseCard(
                context,
                "Zen Leader 1",
                "Leading with Energy",
                0.45,
                "Level 5/20",
                AppColors.primaryBlue,
              ),
              const SizedBox(width: 16),
              _buildCourseCard(
                context,
                "HEAL 1",
                "Leading with Connection",
                0.1,
                "Level 2/15",
                AppColors.teal,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, String sub, double progress, String level, Color color) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
          const SizedBox(height: 4),
          Text(sub, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: AppColors.accentDark, fontSize: 15)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(level, style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey)),
              Text("${(progress * 100).toInt()}%", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.progressGreen)),
            ],
          ),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: progress,
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.background,
            progressColor: AppColors.progressGreen,
            barRadius: const Radius.circular(4),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearningDayDetailScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color.withOpacity(0.1),
                foregroundColor: color,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("RESUME", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Programs & Events",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 16),
          _buildEventItem("Zen Leader 2 – Leading Fearlessly", "Mar 25", "Online", "Program"),
          const SizedBox(height: 12),
          _buildEventItem("FEBI Certification", "Apr 02", "Chicago, IL", "Certification"),
          const SizedBox(height: 12),
          _buildEventItem("HEAL Leadership Retreat", "May 15", "San Diego, CA", "Retreat"),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String date, String location, String tag) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(date.split(' ')[0], style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryBlue)),
                Text(date.split(' ')[1], style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryBlue)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.accentDark)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(location, style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
                      child: Text(tag, style: GoogleFonts.nunito(fontSize: 10, color: Colors.grey)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsights(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Insights on Leadership",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildInsightCard(context, "Mindfulness in Leadership", "How breathing changes decisions.", "https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=400&q=80"),
              const SizedBox(width: 16),
              _buildInsightCard(context, "Transform Fear into Opportunity", "Zen techniques for difficult times.", "https://images.unsplash.com/photo-1518199266791-5375a83190b7?auto=format&fit=crop&w=400&q=80"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInsightCard(BuildContext context, String title, String desc, String img) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailScreen())),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.network(img, height: 120, width: 220, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyPractice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.accentDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                  child: const Icon(Icons.track_changes, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Daily Practice", style: GoogleFonts.fredoka(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Meditation & Reflection", style: GoogleFonts.nunito(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.progressGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text("START TODAY'S PRACTICE", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
