import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.accentDark),
          title: Text("COURSES", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.primaryBlue,
            indicatorWeight: 3,
            labelColor: AppColors.primaryBlue,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.fredoka(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "In progress"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseList(isCompleted: false),
            _buildCourseList(isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList({required bool isCompleted}) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildPremiumCourseCard(
          "Lead from within",
          "Instructor",
          0.75,
          isCompleted,
        ),
        _buildPremiumCourseCard(
          "Meditation for professionals",
          "Mentor",
          0.30,
          isCompleted,
        ),
        if (isCompleted)
          _buildPremiumCourseCard(
            "Mindful thinking",
            "Giảng viên Cao Anh",
            1.0,
            true,
          ),
      ],
    );
  }

  Widget _buildPremiumCourseCard(String title, String instructor, double progress, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              image: const DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.accentDark),
                ),
                const SizedBox(height: 4),
                Text(
                  instructor,
                  style: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: isCompleted ? 1.0 : progress,
                          minHeight: 10,
                          backgroundColor: AppColors.background,
                          color: isCompleted ? AppColors.progressGreen : AppColors.primaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (!isCompleted)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: Text(
                      "CONTINUE LEARNING",
                      style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                if (isCompleted)
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      side: const BorderSide(color: AppColors.primaryBlue),
                    ),
                    child: Text(
                      "VIEW CERTIFICATE",
                      style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
