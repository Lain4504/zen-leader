import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:zen_leader/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.accentDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "CÀI ĐẶT",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.accentDark),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSettingsSection("ỨNG DỤNG", [
            _buildSettingsItem(LucideIcons.moon, "Chế độ tối", hasSwitch: true),
            _buildSettingsItem(LucideIcons.bell, "Thông báo nhấn", hasSwitch: true),
            _buildSettingsItem(LucideIcons.clock, "Nhắc nhở học tập", hasSwitch: true),
          ]),
          const SizedBox(height: 32),
          _buildSettingsSection("KHOẢN VÀ BẢO MẬT", [
            _buildSettingsItem(LucideIcons.shieldCheck, "Quyền riêng tư"),
            _buildSettingsItem(LucideIcons.lock, "Đổi mật khẩu"),
            _buildSettingsItem(LucideIcons.trash2, "Xóa tài khoản", isDestructive: true),
          ]),
          const SizedBox(height: 32),
          _buildSettingsSection("HỖ TRỢ", [
            _buildSettingsItem(LucideIcons.helpCircle, "Trung tâm trợ giúp"),
            _buildSettingsItem(LucideIcons.fileText, "Điều khoản dịch vụ"),
          ]),
          const SizedBox(height: 48),
          Center(
            child: Text(
              "Phiên bản 1.0.2 (Build 45)",
              style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.fredoka(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textMuted),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String label, {bool hasSwitch = false, bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : AppColors.primaryBlue, size: 20),
      title: Text(
        label,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : AppColors.accentDark,
        ),
      ),
      trailing: hasSwitch 
        ? Switch(value: icon == LucideIcons.moon ? false : true, onChanged: (v) {}, activeColor: AppColors.primaryBlue)
        : const Icon(LucideIcons.chevronRight, size: 18, color: Colors.grey),
      onTap: () {},
    );
  }
}
