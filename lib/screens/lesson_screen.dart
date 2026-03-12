import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int? _selectedOption;

  final List<String> _options = [
    "Dậy sớm và tập thể dục 30 phút",
    "Ngồi thiền 10 phút trước khi bắt đầu việc",
    "Uống 2 ly cà phê thật đậm",
    "Kiểm tra email ngay khi vừa mở mắt",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.x, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: LinearPercentIndicator(
          lineHeight: 12.0,
          percent: 0.45,
          backgroundColor: Colors.grey[200],
          progressColor: AppColors.progressGreen,
          barRadius: const Radius.circular(10),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "BÀI TẬP TÌNH HUỐNG",
              style: GoogleFonts.fredoka(
                color: AppColors.textMuted,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Cách tốt nhất để nạp năng lượng 'tĩnh' vào buổi sáng là gì?",
              style: GoogleFonts.nunito(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.accentDark,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedOption == index;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedOption = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryBlue.withOpacity(0.05) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: AppColors.primaryBlue.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
                                  width: 2,
                                ),
                                color: isSelected ? AppColors.primaryBlue : Colors.white,
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check, size: 18, color: Colors.white)
                                  : null,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                _options[index],
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? AppColors.primaryBlue : AppColors.accentDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _selectedOption != null ? () {
                      // Logic kiểm tra câu trả lời
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedOption != null ? AppColors.primaryBlue : Colors.grey.shade300,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "KIỂM TRA",
                      style: GoogleFonts.fredoka(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
