import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/course_detail_path_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverAppBar(context),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildOverview(),
                    _buildCurriculum(),
                    _buildGamificationCard(),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ],
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

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      backgroundColor: AppColors.primaryBlue,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/2dbfb0dc-be08-4c98-ba00-0d47129ccc57/reflect-web-square.jpg?format=1500w",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "ZL1 / HEAL1 • COURSE DASHBOARD",
              style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Leading with Energy and Connection",
            style: GoogleFonts.fredoka(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.accentDark),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(radius: 12, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 14, color: Colors.white)),
              const SizedBox(width: 8),
              Text("with Ginny Whitelaw & Team", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14)),
              const Spacer(),
              Icon(Icons.event_available, color: Colors.green.shade600, size: 18),
              const SizedBox(width: 4),
              Text("Sept 25–28", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Welcome to ZL1 / HEAL1"),
          const SizedBox(height: 12),
          Text(
            "Below you'll find everything you need for the program—from prework to your completion certificate. Click on each section to see the tasks and resources inside.",
            style: GoogleFonts.nunito(color: Colors.grey, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Zen Leadership begins with a flip from coping to transforming, from not seeing to seeing, from cognitive to embodied, from local self to whole Self, culminating in leadership that is wise, resonant and fully resourced.",
                  style: GoogleFonts.nunito(
                    color: Colors.grey.shade800,
                    height: 1.6,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "— Ginny Whitelaw Roshi",
                    style: GoogleFonts.nunito(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculum() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Section outline"),
          const SizedBox(height: 16),
          _buildCurriculumItem(
            title: "Getting ready for ZL1 / HEAL1",
            subtitle: "Prework: profile, FEBI, leadership challenge, space, opening reflection",
            icon: Icons.flag_circle_outlined,
          ),
          _buildCurriculumItem(
            title: "Check these off before we begin",
            subtitle: "Workbook, agenda, class roster, tech & space check",
            icon: Icons.checklist_outlined,
          ),
          _buildCurriculumItem(
            title: "ZL1 - Day 1",
            subtitle: "Live session, recording & additional resources",
            icon: Icons.calendar_view_day,
          ),
          _buildCurriculumItem(
            title: "ZL1 - Day 2",
            subtitle: "Live session, recording & shared resources",
            icon: Icons.calendar_view_day,
          ),
          _buildCurriculumItem(
            title: "ZL1 - Day 3",
            subtitle: "Live session, recording & shared resources",
            icon: Icons.calendar_view_day,
          ),
          _buildCurriculumItem(
            title: "ZL1 - Day 4",
            subtitle: "Live session, recording & shared resources",
            icon: Icons.calendar_view_day,
          ),
          _buildCurriculumItem(
            title: "Post-program follow-up",
            subtitle: "Closing reflection, group photo, next steps & discussion forum",
            icon: Icons.auto_awesome,
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12, height: 1.4)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }

  Widget _buildGamificationCard() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Completion & certificates", style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.workspace_premium, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    "Get your ZL / HEAL certificate\nwhen you complete the program",
                    style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.accentDark, height: 1.4),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(Icons.emoji_events, color: Colors.amber, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.accentDark),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
    );
  }

  Widget _buildStickyCTA(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseDetailPathScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: Text(
          "GO TO COURSE OUTLINE",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
