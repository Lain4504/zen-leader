import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/lesson_screen.dart';
import 'package:zen_leader/screens/live_schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              _buildTopStat(LucideIcons.flame, "12", Colors.orange),
              const SizedBox(width: 16),
              _buildTopStat(LucideIcons.star, "1450", Colors.amber),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LiveScheduleScreen()),
                  );
                },
                icon: const Icon(LucideIcons.calendar, color: AppColors.primaryBlue),
              ),
              const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryBlue,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildLessonNode(
              context,
              title: "Lãnh đạo bản thân",
              icon: LucideIcons.user,
              progress: 0.8,
              align: 0,
              isCompleted: true,
            ),
            _buildPathLine(isRight: true),
            _buildLessonNode(
              context,
              title: "Quản trị năng lượng",
              icon: LucideIcons.zap,
              progress: 0.4,
              align: 40,
              isActive: true,
            ),
            _buildPathLine(isRight: false),
            _buildLessonNode(
              context,
              title: "Thiền định",
              icon: LucideIcons.compass,
              progress: 0,
              align: -40,
            ),
            _buildPathLine(isRight: true),
            _buildLessonNode(
              context,
              title: "Lãnh đạo đội nhóm",
              icon: LucideIcons.users,
              progress: 0,
              align: 20,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildTopStat(IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 4),
        Text(
          value,
          style: GoogleFonts.fredoka(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.accentDark,
          ),
        ),
      ],
    );
  }

  Widget _buildLessonNode(
    BuildContext context, {
    required String title,
    required IconData icon,
    required double progress,
    double align = 0,
    bool isActive = false,
    bool isCompleted = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: align > 0 ? align : 0, right: align < 0 ? -align : 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LessonScreen()),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? AppColors.progressGreen : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 0,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: isActive ? AppColors.primaryBlue : Colors.grey.shade300,
                      width: 4,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 36,
                    color: isCompleted ? Colors.white : (isActive ? AppColors.primaryBlue : Colors.grey),
                  ),
                ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .scale(begin: const Offset(1, 1), end: Offset(isActive ? 1.05 : 1, isActive ? 1.05 : 1), duration: 1000.ms),
                if (isActive)
                  Positioned(
                    top: -10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "BẮT ĐẦU",
                        style: GoogleFonts.fredoka(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.accentDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathLine({required bool isRight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomPaint(
        size: const Size(60, 40),
        painter: PathPainter(isRight: isRight),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  final bool isRight;
  PathPainter({required this.isRight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final path = Path();
    if (isRight) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(size.width, size.height / 2, 0, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.quadraticBezierTo(0, size.height / 2, size.width, size.height);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
