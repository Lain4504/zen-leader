import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/lesson_screen.dart';

class ZenLeaderPathwayScreen extends StatelessWidget {
  const ZenLeaderPathwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverHeader(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(double.infinity, 800),
                      painter: PathwayPainter(),
                    ),
                    Column(
                      children: [
                        _buildNode(
                          id: "ZL1",
                          title: "Foundations",
                          icon: Icons.spa,
                          status: NodeStatus.completed,
                          progress: 1.0,
                          xp: "+50 XP",
                          context: context,
                        ),
                        const SizedBox(height: 100),
                        _buildNode(
                          id: "ZL2",
                          title: "Inner Mountain",
                          icon: Icons.terrain,
                          status: NodeStatus.active,
                          progress: 0.45,
                          xp: "+100 XP",
                          offset: 80,
                          context: context,
                        ),
                        const SizedBox(height: 100),
                        _buildMilestone(
                          icon: Icons.emoji_events,
                          title: "Milestone: Resilience",
                          color: AppColors.teal,
                          offset: -60,
                        ),
                        const SizedBox(height: 100),
                        _buildNode(
                          id: "ZL3",
                          title: "True Transformation",
                          icon: Icons.explore,
                          status: NodeStatus.locked,
                          progress: 0,
                          xp: "+150 XP",
                          offset: -40,
                          context: context,
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.0,
      backgroundColor: AppColors.primaryBlue,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryBlue,
                    AppColors.primaryBlue.withOpacity(0.8),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -50,
              bottom: -20,
              child: Icon(
                Icons.spa,
                size: 250,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.progressGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "PROGRAM PATHWAY",
                      style: GoogleFonts.fredoka(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Zen Leader Journey",
                    style: GoogleFonts.fredoka(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Develop leadership through mindfulness and transformation.",
                    style: GoogleFonts.nunito(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
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

  Widget _buildNode({
    required String id,
    required String title,
    required IconData icon,
    required NodeStatus status,
    required double progress,
    required String xp,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (status == NodeStatus.active)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.amber.withOpacity(0.3), blurRadius: 10),
                    ],
                  ),
                  child: Text(
                    xp,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ).animate(onPlay: (c) => c.repeat(reverse: true))
                 .slideX(begin: -0.1, end: 0.1, duration: 1000.ms),
              GestureDetector(
                onTap: () {
                  if (status != NodeStatus.locked) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonScreen()));
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: nodeColor.withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 6,
                        color: nodeColor,
                        backgroundColor: AppColors.background,
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: nodeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        status == NodeStatus.locked ? Icons.lock : icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
              "$id: $title",
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

  Widget _buildMilestone({
    required IconData icon,
    required String title,
    required Color color,
    double offset = 0,
  }) {
    return Transform.translate(
      offset: Offset(offset, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.3), width: 2),
            ),
            child: Icon(icon, color: color, size: 40),
          ).animate(onPlay: (c) => c.repeat())
           .shimmer(delay: 2.seconds, duration: 1.5.seconds, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.fredoka(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

enum NodeStatus { completed, active, locked }

class PathwayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 2 + 150, 200, size.width / 2, 400);
    path.quadraticBezierTo(size.width / 2 - 150, 600, size.width / 2, 800);
    
    // Draw dashed path for better look
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
