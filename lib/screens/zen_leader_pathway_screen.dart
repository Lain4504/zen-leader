import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/course_detail_screen.dart';
import 'package:zen_leader/screens/course_detail2_screen.dart';

class ZenLeaderPathwayScreen extends StatelessWidget {
  const ZenLeaderPathwayScreen({super.key});

  static const String _mockCourseImageUrl =
      "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/ef0b16ff-6bc8-4e1d-bc13-cc25bd07924f/Lake+Superior+Blue.jpg?format=750w";

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
                      size: const Size(double.infinity, 780),
                      painter: PathwayPainter(),
                    ),
                    Column(
                      children: [
                        _buildNode(
                          id: "ZL1",
                          title: "Foundations",
                          imageUrl: _mockCourseImageUrl,
                          status: NodeStatus.active,
                          progress: 0.0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
                            );
                          },
                          context: context,
                        ),
                        const SizedBox(height: 110),
                        _buildNode(
                          id: "ZL2",
                          title: "Inner Mountain",
                          imageUrl:
                              "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/f824ddfd-d436-4d0c-9ea7-4758e0faa042/yellowstone+music+%282%29.jpg?format=2500w",
                          status: NodeStatus.active,
                          progress: 0.0,
                          offset: 80,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CourseDetail2Screen()),
                            );
                          },
                          context: context,
                        ),
                        const SizedBox(height: 110),
                        _buildNode(
                          id: "ZL3",
                          title: "True Transformation",
                          imageUrl: _mockCourseImageUrl,
                          status: NodeStatus.locked,
                          progress: 0.0,
                          offset: -40,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
                            );
                          },
                          context: context,
                        ),
                        const SizedBox(height: 110),
                        _buildCertificateNode(
                          context: context,
                          status: NodeStatus.locked,
                          offset: 60,
                        ),
                        const SizedBox(height: 40),
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
                    "Zen Leader Program",
                    style: GoogleFonts.fredoka(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Explore the 3-course pathway. Start with course 1, then unlock the next courses.",
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
    required String imageUrl,
    required NodeStatus status,
    required double progress,
    double offset = 0,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    final bool isLocked = status == NodeStatus.locked;
    final Color nodeColor = isLocked ? Colors.grey.shade300 : AppColors.primaryBlue;

    return Transform.translate(
      offset: Offset(offset, 0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (!isLocked) {
            onTap?.call();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This course is locked')),
            );
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (status == NodeStatus.active)
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 14),
                      ],
                    ),
                    child: Text(
                      "YOU'RE HERE",
                      style: GoogleFonts.fredoka(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0.8,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                        begin: const Offset(1.0, 1.0),
                        end: const Offset(1.04, 1.04),
                        duration: 900.ms,
                        curve: Curves.easeInOut,
                      ),
                Stack(
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
                            color: (isLocked ? Colors.black : nodeColor).withOpacity(0.12),
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
                        value: isLocked ? 0 : progress,
                        strokeWidth: 6,
                        color: nodeColor,
                        backgroundColor: AppColors.background,
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: isLocked ? Colors.grey.shade200 : nodeColor,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(imageUrl, fit: BoxFit.cover),
                            if (isLocked) ...[
                              Container(color: Colors.white.withOpacity(0.55)),
                              const Center(
                                child: Icon(Icons.lock, color: Colors.grey, size: 22),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  color: isLocked ? Colors.grey : AppColors.accentDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateNode({
    required BuildContext context,
    required NodeStatus status,
    double offset = 0,
  }) {
    final bool isLocked = status == NodeStatus.locked;

    return Transform.translate(
      offset: Offset(offset, 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (!isLocked) {
                // In future: navigate to certificate detail / share screen.
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 16, offset: const Offset(0, 8)),
                    ],
                  ),
                ),
                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: isLocked ? Colors.grey.shade200 : AppColors.progressGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.workspace_premium,
                    color: isLocked ? Colors.grey : Colors.white,
                    size: 36,
                  ),
                ),
                if (isLocked)
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
                        ],
                      ),
                      child: const Icon(Icons.lock, color: Colors.grey, size: 16),
                    ),
                  ),
              ],
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
              "CERTIFICATE",
              style: GoogleFonts.fredoka(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: isLocked ? Colors.grey : AppColors.accentDark,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum NodeStatus { active, locked }

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
    path.quadraticBezierTo(size.width / 2 + 140, 190, size.width / 2, 330);
    path.quadraticBezierTo(size.width / 2 - 140, 470, size.width / 2, 610);
    path.quadraticBezierTo(size.width / 2 + 120, 700, size.width / 2, 770);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
