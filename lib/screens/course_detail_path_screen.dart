import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/learning_day_detail_screen.dart';

class CourseDetailPathScreen extends StatelessWidget {
  const CourseDetailPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildPremiumSliverAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildZigZagNodes(context),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 24,
            child: _buildFloatingEnrollButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      backgroundColor: AppColors.primaryBlue,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "LEAD FROM WITHIN",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80",
              fit: BoxFit.cover,
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
    );
  }

  Widget _buildZigZagNodes(BuildContext context) {
    return Column(
      children: [
        _buildPathNode(context, 1, "Begin with awareness", true, 0),
        _buildPathNode(context, 2, "Deep listening", true, 60),
        _buildPathNode(context, 3, "Empathy for colleagues", false, -60, isActive: true),
        _buildPathNode(context, 4, "Resolving conflict", false, 60, isLocked: true),
        _buildPathNode(context, 5, "Building trust", false, -60, isLocked: true),
        _buildPathNode(context, 6, "Leading by example", false, 0, isLocked: true),
      ],
    );
  }

  Widget _buildPathNode(BuildContext context, int index, String title, bool isCompleted, double offset, {bool isActive = false, bool isLocked = false}) {
    Color nodeColor = isCompleted 
        ? AppColors.progressGreen 
        : (isActive ? AppColors.primaryBlue : Colors.grey.shade300);

    return Transform.translate(
      offset: Offset(offset, 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (!isLocked) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LearningDayDetailScreen()));
              }
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: nodeColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
                ],
              ),
              child: Center(
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(color: nodeColor, shape: BoxShape.circle),
                  child: Center(
                    child: isLocked
                        ? const Icon(LucideIcons.lock, color: Colors.white, size: 20)
                        : isCompleted
                            ? const Icon(LucideIcons.check, color: Colors.white, size: 24)
                            : Text(
                                "$index",
                                style: GoogleFonts.fredoka(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: isLocked ? Colors.grey : AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildFloatingEnrollButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: AppColors.primaryBlue.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(LucideIcons.playCircle, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Text(
            "ENROLL NOW",
            style: GoogleFonts.fredoka(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
