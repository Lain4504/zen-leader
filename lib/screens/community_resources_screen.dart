import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class CommunityResourcesScreen extends StatelessWidget {
  const CommunityResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  _buildHeaderIntro(),
                  _buildMemberResourcesSection(),
                  _buildNonMemberResourcesSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Community Resources",
        style: GoogleFonts.fredoka(
          fontWeight: FontWeight.bold,
          color: AppColors.accentDark,
        ),
      ),
    );
  }

  Widget _buildHeaderIntro() {
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
          Text(
            "Welcome to Community Resources!",
            style: GoogleFonts.fredoka(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "In this library, you will find videos, articles, podcast interviews, presentations and templates to support you in your journey. This is a space for our community to come together to share and learn, including resources from our IZL community and materials that inspire us.",
            style: GoogleFonts.nunito(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "All resources that are currently accessible (as of December 15, 2025) under Member Resources will be available to members only starting January 15, 2026. If you are not yet a member, sign up now and continue to have access starting mid-January.",
            style: GoogleFonts.nunito(
              fontSize: 13,
              height: 1.5,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          _buildGinnyQuoteCard(),
        ],
      ),
    );
  }

  Widget _buildGinnyQuoteCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We feel called to cultivate through community and collaboration a critical mass of leaders who can lift the world to greater wisdom, healing, resilience and beauty. And that calls for even stronger ties among our community.",
            style: GoogleFonts.nunito(
              fontSize: 13,
              height: 1.6,
              color: AppColors.accentDark,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "— Ginny Whitelaw Roshi, IZL Founder & CEO",
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberResourcesSection() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Member Resources",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Curated collections available to IZL members.",
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          _buildResourceCard(
            title: "Zen Leadership",
            description: "Shared resources for the Zen Leader journey.",
            tag: "Database",
            accessNote: "Available to Zen Leadership members.",
            icon: Icons.self_improvement,
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            title: "FEBI",
            description: "Shared FEBI tools, practices and case studies.",
            tag: "Database",
            accessNote: "Available to FEBI participants and alumni.",
            icon: Icons.bolt,
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            title: "HEAL",
            description: "Shared resources for HEAL healthcare cohorts.",
            tag: "Database",
            accessNote: "Available to HEAL alumni.",
            icon: Icons.local_hospital,
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            title: "Zen",
            description: "Shared Zen teachings, talks and practice videos.",
            tag: "Database",
            accessNote: "Available to Zen training members.",
            icon: Icons.spa,
          ),
        ],
      ),
    );
  }

  Widget _buildNonMemberResourcesSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Non-member Resources",
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Explore a selection of open resources. Unlock the full library by becoming a member.",
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          _buildResourceCard(
            title: "Zen Leadership (public)",
            description: "Sample videos and articles from the Zen Leader pathway.",
            tag: "Open access",
            accessNote: "More content unlocks with a membership plan.",
            icon: Icons.play_circle_outline,
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            title: "FEBI (public)",
            description: "Intro content on energy patterns and FEBI.",
            tag: "Open access",
            accessNote: "Deeper materials available for members.",
            icon: Icons.grid_view,
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            title: "HEAL (public)",
            description: "Selected resources on healing-centered leadership.",
            tag: "Open access",
            accessNote: "Full library available to members and HEAL cohorts.",
            icon: Icons.favorite_outline,
          ),
          const SizedBox(height: 24),
          _buildMembershipCallout(),
        ],
      ),
    );
  }

  Widget _buildResourceCard({
    required String title,
    required String description,
    required String tag,
    required String accessNote,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primaryBlue),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentDark,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.fredoka(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    height: 1.5,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  accessNote,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    height: 1.4,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipCallout() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          const Icon(Icons.workspace_premium, color: AppColors.primaryBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Become a member",
                  style: GoogleFonts.fredoka(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Unlock the full Member Resources library and stay updated as new content is added.",
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    height: 1.5,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              // In a real app this would navigate to membership / pricing.
            },
            child: Text(
              "Learn more",
              style: GoogleFonts.fredoka(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

