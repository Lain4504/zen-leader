import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class LiveScheduleScreen extends StatefulWidget {
  const LiveScheduleScreen({super.key});

  @override
  State<LiveScheduleScreen> createState() => _LiveScheduleScreenState();
}

class _LiveScheduleScreenState extends State<LiveScheduleScreen> {
  int _selectedDayIndex = 0;
  final List<String> _days = ["T2", "T3", "T4", "T5", "T6", "T7", "CN"];
  final List<String> _dates = ["12", "13", "14", "15", "16", "17", "18"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("LỊCH TRỰC TIẾP", style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildCalendarStrip(),
          const SizedBox(height: 10),
          _buildViewOptions(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildSessionCard(
                  title: "Thiền định & Lãnh đạo bản thân",
                  instructor: "Thầy Minh Niệm",
                  course: "Zen Leader 1",
                  time: "20:30 PM",
                  duration: "60 phút",
                  participants: "128",
                  status: "LIVE",
                ),
                _buildSessionCard(
                  title: "Quản trị cảm xúc trong đàm phán",
                  instructor: "Trương Nguyện Thành",
                  course: "Lãnh đạo từ tâm",
                  time: "14:00 PM",
                  duration: "90 phút",
                  participants: "45",
                  status: "Upcoming",
                ),
                _buildSessionCard(
                  title: "Năng lượng tĩnh cho Leader",
                  instructor: "Coach Duy Khanh",
                  course: "Workshop",
                  time: "Hôm qua",
                  duration: "120 phút",
                  participants: "300",
                  status: "Completed",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarStrip() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(_days.length, (index) {
            bool isSelected = _selectedDayIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedDayIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 50,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryBlue : Colors.grey.shade200,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      _days[index],
                      style: GoogleFonts.nunito(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _dates[index],
                      style: GoogleFonts.fredoka(
                        color: isSelected ? Colors.white : AppColors.accentDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildViewOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          _buildOptionChip("Hôm nay", true),
          const SizedBox(width: 8),
          _buildOptionChip("Tuần này", false),
          const Spacer(),
          const Icon(LucideIcons.calendar, size: 20, color: AppColors.primaryBlue),
        ],
      ),
    );
  }

  Widget _buildOptionChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryBlue.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          color: isActive ? AppColors.primaryBlue : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSessionCard({
    required String title,
    required String instructor,
    required String course,
    required String time,
    required String duration,
    required String participants,
    required String status,
  }) {
    Color statusColor = status == "LIVE" 
      ? Colors.red 
      : (status == "Upcoming" ? AppColors.teal : Colors.grey);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    if (status == "LIVE")
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Text(
                      status.toUpperCase(),
                      style: GoogleFonts.fredoka(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildParticipantIcon(participants),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.accentDark,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
              const SizedBox(width: 8),
              Text(
                instructor,
                style: GoogleFonts.nunito(fontWeight: FontWeight.w600, color: AppColors.textMuted),
              ),
              const Spacer(),
              Text(
                course,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildInfoItem(LucideIcons.clock, time),
              const SizedBox(width: 16),
              _buildInfoItem(LucideIcons.hourglass, duration),
            ],
          ),
          const SizedBox(height: 20),
          _buildActionButton(status),
        ],
      ),
    );
  }

  Widget _buildParticipantIcon(String count) {
    return Row(
      children: [
        const Icon(LucideIcons.users, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(count, style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textMain),
        const SizedBox(width: 6),
        Text(text, style: GoogleFonts.nunito(fontSize: 13, color: AppColors.textMain)),
      ],
    );
  }

  Widget _buildActionButton(String status) {
    String label = "Tham gia ngay";
    IconData icon = LucideIcons.video;
    bool isOutline = false;

    if (status == "Upcoming") {
      label = "Nhắc tôi";
      icon = LucideIcons.bell;
      isOutline = true;
    } else if (status == "Completed") {
      label = "Xem lại bản ghi";
      icon = LucideIcons.playCircle;
      isOutline = true;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          if (status == "Upcoming") {
            _showReminderSettings();
          }
        },
        icon: Icon(icon, size: 18),
        label: Text(label, style: GoogleFonts.fredoka(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutline ? Colors.white : AppColors.primaryBlue,
          foregroundColor: isOutline ? AppColors.primaryBlue : Colors.white,
          elevation: 0,
          side: isOutline ? const BorderSide(color: AppColors.primaryBlue) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  void _showReminderSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CÀI ĐẶT NHẮC NHỞ",
                style: GoogleFonts.fredoka(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentDark,
                ),
              ),
              const SizedBox(height: 24),
              _buildReminderToggle("10 phút trước khi bắt đầu", true),
              const SizedBox(height: 16),
              _buildReminderToggle("1 giờ trước khi bắt đầu", false),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text("HÒAN TẤT", style: GoogleFonts.fredoka(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReminderToggle(String title, bool val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600)),
        Switch(
          value: val,
          onChanged: (v) {},
          activeColor: AppColors.primaryBlue,
        ),
      ],
    );
  }
}
