import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/course_detail_path_screen.dart';

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
            _buildCourseList(context, isCompleted: false),
            _buildCourseList(context, isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(BuildContext context, {required bool isCompleted}) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildPremiumCourseCard(
          context: context,
          title: "ZL1 / HEAL1 – Leading with Energy and Connection",
          instructor: "with Ginny Whitelaw & Team",
          progress: isCompleted ? 1.0 : 0.45,
          isCompleted: isCompleted,
          imageUrl:
              "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/2dbfb0dc-be08-4c98-ba00-0d47129ccc57/reflect-web-square.jpg?format=1500w",
        ),
        _buildPremiumCourseCard(
          context: context,
          title: "Zen Leader 2 – Leading Fearlessly, Transforming Relationships",
          instructor: "Upcoming online weekend program",
          progress: isCompleted ? 1.0 : 0.0,
          isCompleted: isCompleted,
          imageUrl:
              "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/f824ddfd-d436-4d0c-9ea7-4758e0faa042/yellowstone+music+%282%29.jpg?format=1500w",
        ),
        if (isCompleted)
          _buildPremiumCourseCard(
            context: context,
            title: "FEBI-4U – Explore mind–body patterns",
            instructor: "Certification track in FEBI-4U",
            progress: 1.0,
            isCompleted: true,
            imageUrl:
                "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/1724353537007-3T5HN25TRRXHBG8YBVZC/febi-4arrow-hor.jpg?format=1500w",
          ),
      ],
    );
  }

  Widget _buildPremiumCourseCard({
    required BuildContext context,
    required String title,
    required String instructor,
    required double progress,
    required bool isCompleted,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseDetailPathScreen()),
        );
      },
      child: Container(
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
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
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
                        "${((isCompleted ? 1.0 : progress) * 100).toInt()}%",
                        style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (!isCompleted)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CourseDetailPathScreen()),
                        );
                      },
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
      ),
    );
  }
}
