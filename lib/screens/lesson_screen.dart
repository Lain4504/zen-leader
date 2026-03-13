import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/screens/day_completed_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const LinearProgressIndicator(
            value: 0.4,
            minHeight: 12,
            backgroundColor: AppColors.background,
            color: AppColors.progressGreen,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/logo-zenleader.webp',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Scenario question:",
                    style: GoogleFonts.fredoka(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "When an employee makes a serious mistake that affects the project, what should a mindful leader's attitude be?",
                    style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.accentDark, height: 1.4),
                  ),
                  const SizedBox(height: 32),
                  _buildAnswerCard(0, "Criticize them publicly in front of the team as an example."),
                  _buildAnswerCard(1, "Stay calm, listen to the cause and find a solution together."),
                  _buildAnswerCard(2, "Ignore the mistake to keep harmony in the group."),
                  _buildAnswerCard(3, "Fire the employee immediately to reduce risk."),
                ],
              ),
            ),
          ),
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildAnswerCard(int index, String text) {
    bool isSelected = _selectedAnswer == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAnswer = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade100,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primaryBlue : AppColors.accentDark,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primaryBlue, size: 24),
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
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5)),
        ],
      ),
      child: ElevatedButton(
        onPressed: _selectedAnswer != null ? () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DayCompletedScreen()));
        } : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          disabledBackgroundColor: Colors.grey.shade200,
        ),
        child: Text(
          "CHECK",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
