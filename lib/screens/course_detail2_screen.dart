import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class CourseDetail2Screen extends StatelessWidget {
  const CourseDetail2Screen({super.key});

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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140),
                  child: Column(
                    children: [
                      _buildHeader(),
                      _buildOverview(),
                      _buildTransformationSection(),
                      _buildHowItWorksSection(),
                      _buildPostProgramSection(),
                      _buildRegisterSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
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
              "https://images.squarespace-cdn.com/content/v1/66b622f49a9c4b791061dd7f/ad25f1bf-4c88-4aad-9abe-07e29d76ab5f/Morning+Circle.JPG?format=1500w",
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
              color: AppColors.primaryBlue.withOpacity(0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "ZEN LEADER 2 • NOT YET ENROLLED",
              style: GoogleFonts.fredoka(
                color: AppColors.primaryBlue,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Zen Leader 2",
            style: GoogleFonts.fredoka(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Leading Fearlessly, Transforming Relationships",
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Find your power to reframe fears, resolve conflict and strengthen relationships.",
            style: GoogleFonts.nunito(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
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
          _sectionTitle("What you'll explore"),
          const SizedBox(height: 12),
          Text(
            "What would you make possible if you were fearless? Or if you were less stressed and triggered by difficult people and situations? How might you strengthen your relationships and help those around you move beyond fear?",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Text(
            "Live into the answers here as you learn to work with fear and triggers in yourself and others, and watch your leadership expand and relationships flourish.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 20),
          _sectionTitle("How your leadership grows"),
          const SizedBox(height: 12),
          _bullet("Face into self-limiting fears and free yourself."),
          _bullet("Flip from useless outer blaming to productive inner work."),
          _bullet("Learn how to interrupt and rework fear-based habits."),
          _bullet("Leverage the neuroscience of \"I\" and \"we\"."),
          _bullet("Discover how trauma distorts the present."),
          _bullet(
              "Identify what triggers conflict for people in each of the energy patterns and what they need to move forward."),
          _bullet("Explore how some needs can never be filled enough and what to do about them."),
          _bullet("Flip drama triangles to empowering relationships."),
          _bullet(
              "Apply these learnings to freeing a real fear and strengthening an important relationship in your life right now."),
        ],
      ),
    );
  }

  Widget _buildTransformationSection() {
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
          _sectionTitle("Transformation & impact"),
          const SizedBox(height: 16),
          _testimonialCard(
            quote:
                "This is the best leadership program I have ever participated in. It will give you tools and practices you won’t find anywhere else.",
            name: "Kate Watters",
            role: "Executive Director, Crude Accountability",
          ),
          const SizedBox(height: 12),
          _testimonialCard(
            quote:
                "ZL2 will take you where your inner world is calling you to go. It can show you what you need to do to resolve underlying fears and inner conflict that shape the quality of your experiences and relationships.",
            name: "Clara Rowena (Weng) Suarez",
            role: "Senior Manager, Resilience Teacher",
          ),
          const SizedBox(height: 12),
          _testimonialCard(
            quote:
                "I have never experienced so many amazing shifts in such a short time. The training was far better than I could have imagined.",
            name: "Stacey Bevill",
            role: "PCC, Golden Career Strategies",
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
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
          _sectionTitle("How does it work?"),
          const SizedBox(height: 12),
          Text(
            "A powerful, online weekend of Leading Fearlessly and Transforming Relationships.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 12),
          _bullet(
              "Starts Thursday at 7 pm CT, runs through the weekend, and finishes Sunday at noon CT; approximately 25 hours of training."),
          _bullet(
              "Options in the schedule plus selective access to recordings enable participation from any time zone."),
          const SizedBox(height: 18),
          _sectionTitle("You also receive"),
          const SizedBox(height: 12),
          _bullet("A comprehensive workbook."),
          _bullet("Coaching and discussion around real cases from your own life."),
          _bullet("A Zen toolkit you are never without and practices for how to use it."),
          _bullet("Professional guidance in Zen meditation."),
        ],
      ),
    );
  }

  Widget _buildPostProgramSection() {
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
          _sectionTitle("Post-program support"),
          const SizedBox(height: 12),
          _subSectionTitle("An enriching community"),
          const SizedBox(height: 6),
          Text(
            "Join in monthly gatherings where we take Zen Leadership Off the Cushion (ZLOTC), plus engage in peer coaching, social media, special interest groups and other events.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 16),
          _subSectionTitle("Advanced courses"),
          const SizedBox(height: 6),
          Text(
            "Continue on your journey through the final “flips” of the Zen Leader in ZL3: Leading Transformation. Complete all 3 Zen Leader programs plus FEBI-4U and earn a certificate in Zen Leadership.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 16),
          _subSectionTitle("Ongoing Zen practice"),
          const SizedBox(height: 6),
          Text(
            "Train with us daily in online Zen meditation through our sister organization, Chosei Zen. If Zen training calls you, you’ve found a limitless, world-class pathway into it.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
          const SizedBox(height: 16),
          _subSectionTitle("Access to videos"),
          const SizedBox(height: 6),
          Text(
            "You’ll have access to a rich archive of additional practice and instructional videos, as well as other resources from The Zen Leader, reinforcing and deepening the learnings you experienced.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Register now"),
          const SizedBox(height: 8),
          Text(
            "Regularly \$699; register now for \$549.",
            style: GoogleFonts.nunito(
              color: AppColors.accentDark,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 18),
          _eventCard(
            month: "May",
            title: "Zen Leader 2: Leading Fearlessly, Transforming Relationships",
            dates: "May 7, 2026 – May 10, 2026",
          ),
          const SizedBox(height: 12),
          _eventCard(
            month: "Oct",
            title: "Zen Leader 2: Leading Fearlessly, Transforming Relationships",
            dates: "Oct 22, 2026 – Oct 25, 2026",
          ),
          const SizedBox(height: 18),
          Text(
            "Dates don’t work? Tap below to be added to the waitlist and we’ll notify you when the next program is scheduled.",
            style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.6, fontSize: 13),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: Text(
              "Join the waitlist",
              style: GoogleFonts.fredoka(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyCTA(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 22, offset: const Offset(0, -6)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  "\$549",
                  style: GoogleFonts.fredoka(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "USD",
                  style: GoogleFonts.nunito(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  "Regularly \$699",
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // In a real app this would go to checkout / registration.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              child: Text(
                "REGISTER FOR ZEN LEADER 2",
                style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.accentDark),
    );
  }

  Widget _subSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.fredoka(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14, height: 1.4)),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.nunito(color: Colors.grey.shade800, height: 1.5, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _testimonialCard({required String quote, required String name, required String role}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote,
            style: GoogleFonts.nunito(
              color: Colors.grey.shade800,
              fontSize: 13,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColors.accentDark,
            ),
          ),
          Text(
            role,
            style: GoogleFonts.nunito(color: Colors.grey.shade700, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _eventCard({
    required String month,
    required String title,
    required String dates,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              month,
              style: GoogleFonts.fredoka(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dates,
                  style: GoogleFonts.nunito(color: Colors.grey.shade800, fontSize: 13),
                ),
                const SizedBox(height: 6),
                Text(
                  "4-day program starts Thursday evening at 7 pm CT, runs all day Friday and Saturday, and finishes at noon CT on Sunday.",
                  style: GoogleFonts.nunito(color: Colors.grey.shade700, fontSize: 12, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

