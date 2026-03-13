import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zen_leader/theme/app_colors.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverHeader(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "MINDFUL LEADERSHIP",
                          style: GoogleFonts.fredoka(color: AppColors.teal, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Leading with Awareness: The Path to Clarity",
                        style: GoogleFonts.fredoka(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentDark,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                            child: const Icon(Icons.person, size: 16, color: AppColors.primaryBlue),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "By IZL Team • 6 min read",
                            style: GoogleFonts.nunito(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      _buildContentSection(),
                      const SizedBox(height: 32),
                      _buildInteractionButtons(),
                      const SizedBox(height: 48),
                      Text(
                        "Related Insights",
                        style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.accentDark),
                      ),
                      const SizedBox(height: 16),
                      _buildRelatedArticles(),
                      const SizedBox(height: 100), // Space for sticky CTA
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildStickyCTA(),
        ],
      ),
    );
  }

  Widget _buildSliverHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.bookmark_border, color: Colors.white), onPressed: () {}),
        IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=800&q=80",
              fit: BoxFit.cover,
            ),
            Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.2))),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mindfulness is not just a personal tool for relaxation; it is a fundamental leadership skill. When we lead with awareness, we create a space between stimulus and response, allowing for clearer, more compassionate decision-making.",
          style: GoogleFonts.nunito(fontSize: 18, color: Colors.black87, height: 1.6),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: AppColors.primaryBlue, width: 4)),
          ),
          child: Text(
            "\"Leadership begins with awareness of your own mind.\"",
            style: GoogleFonts.fredoka(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.accentDark, height: 1.4),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "How to start your mindful journey:",
          style: GoogleFonts.fredoka(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.accentDark),
        ),
        const SizedBox(height: 16),
        Text(
          "1. Observe your breath before entering a room.\n2. Practice deep listening without judgment.\n3. Recognize physical sensations of stress and pause.",
          style: GoogleFonts.nunito(fontSize: 18, color: Colors.black87, height: 1.8),
        ),
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network("https://images.unsplash.com/photo-1518199266791-5375a83190b7?auto=format&fit=crop&w=600&q=80"),
        ),
      ],
    );
  }

  Widget _buildInteractionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
            label: const Text("Save Article"),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              foregroundColor: AppColors.primaryBlue,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text("Share Insight"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedArticles() {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSmallCard("Mindfulness in Leadership", "https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=300&q=80"),
          _buildSmallCard("Power of Presence", "https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=300&q=80"),
          _buildSmallCard("Emotional Intelligence", "https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=300&q=80"),
        ],
      ),
    );
  }

  Widget _buildSmallCard(String title, String img) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(img, height: 80, width: 160, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyCTA() {
    return Positioned(
      bottom: 24,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Practice mindfulness", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.accentDark)),
                  Text("Combine theory with action", style: GoogleFonts.nunito(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.progressGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text("START PRACTICE", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
      ).animate().slideY(begin: 1, end: 0, delay: 500.ms, curve: Curves.easeOutCubic),
    );
  }
}
