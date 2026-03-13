import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/lesson_screen.dart';
import 'package:zen_leader/screens/live_schedule_screen.dart';
import 'package:zen_leader/screens/messages_screen.dart';
import 'package:zen_leader/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildPremiumTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(double.infinity, 1000),
                        painter: PathPainter(),
                      ),
                      Column(
                        children: [
                          _buildPremiumNode(
                            icon: LucideIcons.compass,
                            title: "Self leadership",
                            status: NodeStatus.completed,
                            context: context,
                          ),
                          const SizedBox(height: 80),
                          _buildPremiumNode(
                            icon: LucideIcons.batteryCharging,
                            title: "Energy management",
                            status: NodeStatus.completed,
                            offset: 60,
                            context: context,
                          ),
                          const SizedBox(height: 80),
                          _buildPremiumNode(
                            icon: LucideIcons.target,
                            title: "Meditation",
                            status: NodeStatus.active,
                            offset: -60,
                            context: context,
                          ),
                          const SizedBox(height: 80),
                          _buildPremiumNode(
                            icon: LucideIcons.users,
                            title: "Team leadership",
                            status: NodeStatus.locked,
                            context: context,
                          ),
                          const SizedBox(height: 80),
                          _buildPremiumNode(
                            icon: LucideIcons.heart,
                            title: "Heart-centered leadership",
                            status: NodeStatus.locked,
                            offset: 60,
                            context: context,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/logo-zenleader.webp',
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 16),
          _buildPremiumStat(LucideIcons.flame, "12", Colors.orange),
          const SizedBox(width: 8),
          _buildPremiumStat(LucideIcons.star, "1450", Colors.amber),
          const Spacer(),
          _buildIconButton(LucideIcons.bell, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
          }),
          _buildIconButton(LucideIcons.calendar, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveScheduleScreen()));
          }),
          _buildIconButton(LucideIcons.messageCircle, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesScreen()));
          }),
        ],
      ),
    );
  }

  Widget _buildPremiumStat(IconData icon, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
            style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: color, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      constraints: const BoxConstraints(),
      icon: Icon(icon, color: AppColors.primaryBlue, size: 20),
    );
  }

  Widget _buildPremiumNode({
    required IconData icon,
    required String title,
    required NodeStatus status,
    double offset = 0,
    required BuildContext context,
  }) {
    Color nodeColor = status == NodeStatus.completed 
        ? AppColors.progressGreen 
        : (status == NodeStatus.active ? AppColors.primaryBlue : Colors.grey.shade300);

    return Transform.translate(
      offset: Offset(offset, 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (status != NodeStatus.locked) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonScreen()));
              }
            },
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: nodeColor.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (status == NodeStatus.active)
                    const CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 6,
                      color: AppColors.primaryBlue,
                    ).animate(onPlay: (controller) => controller.repeat())
                     .scale(begin: const Offset(1.1, 1.1), end: const Offset(1.2, 1.2), duration: 1000.ms)
                     .fadeOut(duration: 1000.ms),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: nodeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      status == NodeStatus.locked ? LucideIcons.lock : icon,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2)),
              ],
            ),
            child: Text(
              title,
              style: GoogleFonts.fredoka(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: status == NodeStatus.locked ? Colors.grey : AppColors.accentDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum NodeStatus { completed, active, locked }

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 2 + 100, 150, size.width / 2, 300);
    path.quadraticBezierTo(size.width / 2 - 100, 450, size.width / 2, 600);
    path.quadraticBezierTo(size.width / 2 + 100, 750, size.width / 2, 900);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
