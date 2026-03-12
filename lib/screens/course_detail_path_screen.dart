import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/lesson_screen.dart';

class CourseDetailPathScreen extends StatelessWidget {
  const CourseDetailPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "ZEN LEADER 2",
                style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: AppColors.accentDark,
                    child: Center(
                      child: Opacity(
                        opacity: 0.3,
                        child: Icon(LucideIcons.mountain, size: 100, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildLessonNode(context, "Mở đầu: Tâm thế người dẫn dắt", LucideIcons.unlock, true, 0),
                  _buildPathConnector(true),
                  _buildLessonNode(context, "Kết nối sâu sắc", LucideIcons.users, true, 40),
                  _buildPathConnector(false),
                  _buildLessonNode(context, "Sức mạnh của sự tĩnh lặng", LucideIcons.moon, false, -40, isActive: true),
                  _buildPathConnector(true),
                  _buildLessonNode(context, "Lắng nghe thấu cảm", LucideIcons.heart, false, 20, isLocked: true),
                  _buildPathConnector(false),
                  _buildLessonNode(context, "Truyền cảm hứng", LucideIcons.zap, false, -20, isLocked: true),
                  _buildPathConnector(true),
                  _buildLessonNode(context, "Tầm nhìn chiến lược", LucideIcons.eye, false, 30, isLocked: true),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: Text(
              "GHI DANH KHÓA HỌC",
              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLessonNode(
    BuildContext context,
    String title,
    IconData icon,
    bool isCompleted,
    double offset, {
    bool isActive = false,
    bool isLocked = false,
  }) {
    return Transform.translate(
      offset: Offset(offset, 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: isLocked ? null : () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonScreen()));
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLocked ? Colors.grey.shade200 : (isCompleted ? AppColors.progressGreen : Colors.white),
                border: Border.all(
                  color: isActive ? AppColors.primaryBlue : (isLocked ? Colors.grey.shade300 : Colors.white),
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                isLocked ? LucideIcons.lock : icon,
                color: isLocked ? Colors.grey : (isCompleted ? Colors.white : AppColors.primaryBlue),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 120,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isLocked ? Colors.grey : AppColors.accentDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathConnector(bool isRight) {
    return Container(
      height: 40,
      width: 100,
      child: CustomPaint(
        painter: PathLinePainter(isRight: isRight),
      ),
    );
  }
}

class PathLinePainter extends CustomPainter {
  final bool isRight;
  PathLinePainter({required this.isRight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    if (isRight) {
       path.moveTo(size.width * 0.2, 0);
       path.quadraticBezierTo(size.width, size.height / 2, size.width * 0.2, size.height);
    } else {
       path.moveTo(size.width * 0.8, 0);
       path.quadraticBezierTo(0, size.height / 2, size.width * 0.8, size.height);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
