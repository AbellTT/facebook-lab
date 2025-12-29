import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'New',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildNotificationItem(
            name: "Prakash Mishra",
            action: "mentioned you and other followers in a comment",
            time: "2h",
            avatar: "assets/image/1.png",
            badgeIcon: Icons.comment,
            badgeColor: Colors.green,
          ),
          _buildNotificationItem(
            name: "Vijay Gupta",
            action:
                "added 2 posts: \"Mera Comment block ho gya h to aap log...\"",
            time: "8d",
            reactions: "23 Reactions",
            comments: "55 Comments",
            avatar: "assets/image/2.png",
            badgeIcon: Icons.comment,
            badgeColor: Colors.blue,
          ),
          _buildNotificationItem(
            name: "Bible Discussions",
            action: "You might like",
            time: "4d",
            avatar: "assets/image/3.png",
            badgeIcon: Icons.group,
            badgeColor: Colors.blue,
            hasButtons: true,
          ),
          _buildNotificationItem(
            name: "Vijay Gupta",
            action: "mentioned you and other followers in a comment",
            time: "4d",
            avatar: "assets/image/1.png",
            badgeIcon: Icons.comment,
            badgeColor: Colors.green,
            isLiked: true,
          ),
          _buildNotificationItem(
            name: "Moalim Ismail Ali",
            action:
                "made a post you haven't seen: \"Waa inaad ogsoonaataa Waqtigaada...\"",
            time: "3d",
            reactions: "20 reactions",
            comments: "1 comment",
            avatar: "assets/image/2.png",
            badgeIcon: Icons.video_library,
            badgeColor: Colors.red,
          ),
          _buildNotificationItem(
            name: "Vijay Gupta",
            action:
                "is in Khamis Mushait, Saudi Arabia: \"Mahadev ki kripa bani rahe ham sab par...\"",
            time: "7d",
            reactions: "43 Reactions",
            comments: "79 Comments",
            avatar: "assets/image/3.png",
            badgeIcon: Icons.comment,
            badgeColor: Colors.blue,
          ),
          _buildNotificationItem(
            name: "Ennisse Akimana",
            action: "'s birthday today. Help her have a great day!",
            time: "11h",
            avatar: "assets/image/1.png",
            badgeIcon: Icons.cake,
            badgeColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String name,
    required String action,
    required String time,
    required String avatar,
    required IconData badgeIcon,
    required Color badgeColor,
    String? reactions,
    String? comments,
    bool hasButtons = false,
    bool isLiked = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue.withOpacity(0.05), // Light blue tint for unread
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 35, backgroundImage: AssetImage(avatar)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(badgeIcon, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      if (name.isNotEmpty)
                        TextSpan(
                          text: name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      TextSpan(text: " $action"),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    if (reactions != null || comments != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        "· ${reactions ?? ''} ${comments ?? ''}",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                    if (isLiked) ...[
                      const SizedBox(width: 8),
                      const Text(
                        "Like",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
                if (hasButtons) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1877F2),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Join'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Remove'),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
