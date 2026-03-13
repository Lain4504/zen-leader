import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_leader/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
          "NOTIFICATIONS",
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.accentDark),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNotificationList(NotificationType.all),
                _buildNotificationList(NotificationType.community),
                _buildNotificationList(NotificationType.learning),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.primaryBlue,
        indicatorWeight: 3,
        labelColor: AppColors.primaryBlue,
        unselectedLabelColor: Colors.grey,
        labelStyle: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 13),
        tabs: const [
          Tab(text: "All"),
          Tab(text: "Community"),
          Tab(text: "Learning"),
        ],
      ),
    );
  }

  Widget _buildNotificationList(NotificationType type) {
    // Mock data based on type
    final notifications = [
      NotificationItem(
        title: "Live class starting soon: Listening skills",
        subtitle: "Class starts in 15 minutes. Get ready!",
        time: "15 min ago",
        icon: Icons.videocam_outlined,
        iconColor: AppColors.primaryBlue,
        isUnread: true,
      ),
      NotificationItem(
        title: "Your instructor replied to your question",
        subtitle: "'Your question is a good one. You might try practicing...'",
        time: "1 hour ago",
        icon: Icons.chat_bubble_outline,
        iconColor: Colors.orange,
        isUnread: true,
      ),
      NotificationItem(
        title: "You earned the Mindful badge",
        subtitle: "Congratulations! You completed 7 days of meditation in a row.",
        time: "3 hours ago",
        icon: Icons.emoji_events_outlined,
        iconColor: Colors.amber,
        isUnread: false,
      ),
      NotificationItem(
        title: "New lesson: Emotional management in leadership",
        subtitle: "Module 4 is now open. Explore the new content.",
        time: "Yesterday",
        icon: Icons.menu_book_outlined,
        iconColor: AppColors.progressGreen,
        isUnread: false,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _buildNotificationCard(notifications[index]);
      },
    );
  }

  Widget _buildNotificationCard(NotificationItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, color: item.iconColor, size: 24),
              ),
              if (item.isUnread)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.nunito(
                    fontWeight: item.isUnread ? FontWeight.bold : FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: GoogleFonts.nunito(fontSize: 13, color: Colors.grey, height: 1.4),
                ),
                const SizedBox(height: 8),
                Text(
                  item.time,
                  style: GoogleFonts.nunito(fontSize: 11, color: Colors.grey.withOpacity(0.7), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum NotificationType { all, community, learning }

class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isUnread,
  });
}
