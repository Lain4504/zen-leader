import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.accentDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "SETTINGS",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.accentDark),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSettingsSection("APP", [
            _buildSettingsItem(Icons.dark_mode_outlined, "Dark mode", hasSwitch: true),
            _buildSettingsItem(Icons.notifications_none, "Push notifications", hasSwitch: true),
            _buildSettingsItem(Icons.schedule, "Study reminders", hasSwitch: true),
          ]),
          const SizedBox(height: 32),
          _buildSettingsSection("ACCOUNT & PRIVACY", [
            _buildSettingsItem(Icons.verified_user_outlined, "Privacy"),
            _buildSettingsItem(Icons.lock_outline, "Change password"),
            _buildSettingsItem(Icons.delete_outline, "Delete account", isDestructive: true),
          ]),
          const SizedBox(height: 32),
          _buildSettingsSection("SUPPORT", [
            _buildSettingsItem(Icons.help_outline, "Help center"),
            _buildSettingsItem(Icons.description_outlined, "Terms of service"),
          ]),
          const SizedBox(height: 48),
          Center(
            child: Text(
              "Version 1.0.2 (Build 45)",
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
        ? Switch(value: icon == Icons.dark_mode_outlined ? false : true, onChanged: (v) {}, activeColor: AppColors.primaryBlue)
        : const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
      onTap: () {},
    );
  }
}
