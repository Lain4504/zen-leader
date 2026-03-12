import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = "Tiếng Việt";

  final List<Map<String, String>> _languages = [
    {"name": "Tiếng Việt", "flag": "🇻🇳", "native": "Tiếng Việt"},
    {"name": "English", "flag": "🇺🇸", "native": "English"},
    {"name": "Japanese", "flag": "🇯🇵", "native": "日本語"},
    {"name": "Korean", "flag": "🇰🇷", "native": "한국어"},
    {"name": "French", "flag": "🇫🇷", "native": "Français"},
    {"name": "German", "flag": "🇩🇪", "native": "Deutsch"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.accentDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chọn ngôn ngữ của bạn",
                  style: GoogleFonts.fredoka(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Chọn ngôn ngữ bạn muốn sử dụng trong ứng dụng",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm ngôn ngữ...",
                      hintStyle: GoogleFonts.nunito(color: Colors.grey),
                      border: InputBorder.none,
                      icon: const Icon(LucideIcons.search, color: Colors.grey, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                final lang = _languages[index];
                bool isSelected = _selectedLanguage == lang["name"];
                return _buildLanguageCard(lang, isSelected);
              },
            ),
          ),
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(Map<String, String> lang, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _selectedLanguage = lang["name"]!),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              lang["flag"]!,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang["native"]!,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentDark,
                  ),
                ),
                Text(
                  lang["name"]!,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (isSelected)
              const Icon(LucideIcons.checkCircle, color: AppColors.primaryBlue, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: Text(
          "TIẾP TỤC",
          style: GoogleFonts.fredoka(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
