import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String? _selectedCourse = "Meditation & Self leadership";
  final List<String> _tags = ["Discussion", "Question", "Study tips", "Career"];
  final Set<String> _selectedTags = {"Discussion"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: GoogleFonts.nunito(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        leadingWidth: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text("Post", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Post title",
                hintStyle: GoogleFonts.nunito(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            _buildCourseSelector(),
            const SizedBox(height: 16),
            _buildTagSelector(),
            const Divider(),
            const SizedBox(height: 16),
            TextField(
              maxLines: 15,
              style: GoogleFonts.nunito(fontSize: 16, height: 1.6),
              decoration: InputDecoration(
                hintText: "What's on your mind? Share with the Zen community...",
                hintStyle: GoogleFonts.nunito(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 40),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade100)),
        ),
        child: Row(
          children: [
            IconButton(icon: const Icon(LucideIcons.image, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(LucideIcons.list, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(LucideIcons.paperclip, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(LucideIcons.bookOpen, color: AppColors.primaryBlue, size: 20),
          const SizedBox(width: 12),
          Text(
            "Related course:",
            style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _selectedCourse ?? "Not selected",
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: AppColors.primaryBlue, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(LucideIcons.chevronDown, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTagSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add tags:", style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 13)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: _tags.map((tag) {
            bool isSelected = _selectedTags.contains(tag);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedTags.remove(tag);
                  } else {
                    _selectedTags.add(tag);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.nunito(
                    color: isSelected ? Colors.white : AppColors.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
