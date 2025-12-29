import 'package:flutter/material.dart';
import 'friends_page.dart';
import 'notifications_page.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 5 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: _selectedIndex == 0 ? kToolbarHeight : 0,
        title: _selectedIndex == 0
            ? const Text(
                'facebook',
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              )
            : null,
        actions: _selectedIndex == 0
            ? [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.black),
                  onPressed: () {},
                ),
              ]
            : [],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.ondemand_video, 1),
                _buildNavItem(Icons.store, 2),
                _buildNavItem(Icons.group, 3),
                _buildNavItem(Icons.notifications, 4),
                _buildNavItem(Icons.menu, 5),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildFeed();
      case 3:
        return const FriendsPage();
      case 4:
        return const NotificationsPage();
      case 5:
        return const MenuPage();
      default:
        return Center(
          child: Text(
            'Tab $_selectedIndex Placeholder',
            style: const TextStyle(fontSize: 20),
          ),
        );
    }
  }

  Widget _buildFeed() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/image/2.png'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Button pressed!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // transparent background
                      shadowColor: Colors.transparent, // remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color.fromARGB(131, 158, 158, 158),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 2,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What's on your mind?",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("Photo button pressed!");
                  },
                  icon: const Icon(
                    Icons.photo_outlined,
                    color: Color.fromARGB(255, 20, 189, 56),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 8, thickness: 5),

          // Stories Section
          Container(
            color: Colors.white,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return _buildStoryCard(
                  index == 0 ? 'Create Story' : 'Friend $index',
                  index == 0,
                  index,
                );
              },
            ),
          ),
          const Divider(height: 8, thickness: 8),

          // News Feed
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildPostCard(index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF1877F2) : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF1877F2) : Colors.grey,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildStoryCard(String name, bool isYourStory, int index) {
    final List<String> storyImages = [
      'assets/image/1.png',
      'assets/image/2.png',
      'assets/image/3.png',
      'assets/image/4.png',
      'assets/image/5.png',
      'assets/image/6.png',
      'assets/image/7.png',
    ];
    final String storyImage = storyImages[index % storyImages.length];

    return Container(
      width: 110,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(40, 224, 224, 224),
              border: Border.all(
                color: const Color.fromARGB(135, 168, 168, 168),
                width: 0.5,
              ),
              image: DecorationImage(
                image: AssetImage(storyImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isYourStory)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/image/2.png'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1877F2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(221, 255, 255, 255),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFF1877F2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF1877F2),
                    width: 1.5,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(int index) {
    final List<String> profileImages = [
      'assets/image/1.png',
      'assets/image/2.png',
      'assets/image/3.png',
    ];
    final String profileImage = profileImages[index % profileImages.length];
    final String postImage = profileImages[(index + 1) % profileImages.length];
    final String userName = index == 0
        ? "Artist Adrian Moraru"
        : "User Name ${index + 1}";

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(profileImage),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '· Follow',
                            style: TextStyle(
                              color: Color(0xFF1877F2),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '1d · 🌍',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
                IconButton(icon: const Icon(Icons.close), onPressed: () {}),
              ],
            ),
          ),

          // Post Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              index == 0
                  ? 'Mysterious Muse\n(pencil on paper)'
                  : 'This is a sample post text. Having a great day! 🎉',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 12),

          // Post Image
          Image.asset(postImage, width: double.infinity, fit: BoxFit.cover),

          // Reactions Summary
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.thumb_up_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${(index + 1) * 10.7}K',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.mode_comment_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${(index + 1) * 133}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.reply_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${(index + 1) * 248}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1877F2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        Positioned(
                          right: -10,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Center(
                              child: Text('❤', style: TextStyle(fontSize: 10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, 'Like'),
                _buildActionButton(Icons.comment_outlined, 'Comment'),
                _buildActionButton(Icons.share_outlined, 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey.shade700),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
