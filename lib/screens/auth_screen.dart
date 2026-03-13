import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';
import 'package:zen_leader/main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _goToHome,
                  child: Text(
                    "Skip to Home",
                    style: GoogleFonts.nunito(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: AppColors.primaryBlue.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10)),
                        ],
                      ),
                      child: Image.asset(
                        'assets/logo-zenleader.webp',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Log in to IZL Community Hub",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentDark,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Your journey in heart-centered leadership starts here.",
                      style: GoogleFonts.nunito(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _buildTabBar(),
              const SizedBox(height: 32),
              AnimatedBuilder(
                animation: _tabController,
                builder: (context, child) {
                  return _tabController.index == 0 ? _buildLoginForm() : _buildSignUpForm();
                },
              ),
              const SizedBox(height: 48),
              _buildSocialLoginSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: AppColors.primaryBlue),
          insets: EdgeInsets.symmetric(horizontal: 40.0),
        ),
        labelColor: AppColors.primaryBlue,
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelStyle: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16),
        tabs: const [
          Tab(text: "Log in"),
          Tab(text: "Sign up"),
        ],
        onTap: (index) => setState(() {}),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _buildInputField("Email / Username", Icons.email_outlined),
        const SizedBox(height: 16),
        _buildInputField("Password", Icons.lock_outline, isPassword: true),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Lost password?",
              style: GoogleFonts.nunito(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildPrimaryButton("START YOUR JOURNEY"),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        _buildInputField("Full name", Icons.person_outline),
        const SizedBox(height: 16),
        _buildInputField("Email", Icons.email_outlined),
        const SizedBox(height: 16),
        _buildInputField("New password", Icons.lock_outline, isPassword: true),
        const SizedBox(height: 32),
        _buildPrimaryButton("CREATE ACCOUNT"),
      ],
    );
  }

  Widget _buildInputField(String hint, IconData icon, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: TextField(
        obscureText: isPassword,
        style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primaryBlue.withOpacity(0.5), size: 18),
          hintText: hint,
          hintStyle: GoogleFonts.nunito(color: Colors.grey.shade400, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(String text) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: AppColors.primaryBlue.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 6)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNavigation()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15, letterSpacing: 1),
        ),
      ),
    );
  }

  Widget _buildSocialLoginSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.withOpacity(0.15))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Log in with", style: GoogleFonts.nunito(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            Expanded(child: Divider(color: Colors.grey.withOpacity(0.15))),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(Icons.public, Colors.redAccent),
            const SizedBox(width: 32),
            _buildSocialIcon(Icons.apple, Colors.black),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Icon(icon, color: color, size: 28),
        ),
      ),
    );
  }
}
