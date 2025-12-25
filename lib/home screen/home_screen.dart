import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
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
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, true),
                _buildNavItem(Icons.ondemand_video, false),
                _buildNavItem(Icons.store, false),
                _buildNavItem(Icons.group, false),
                _buildNavItem(Icons.notifications, false),
                _buildNavItem(Icons.menu, false),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildStoryCard(
                    index == 0 ? 'Create Story' : 'Friend $index',
                    index == 0,
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
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? const Color(0xFF1877F2) : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? const Color(0xFF1877F2) : Colors.grey,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildStoryCard(String name, bool isYourStory) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // image: const DecorationImage(
        //   image: NetworkImage('https://via.placeholder.com/150'),
        //   fit: BoxFit.cover,
        // ),
      ),
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
                image: AssetImage(
                  'assets/image/1.png',
                ), // use NetworkImage(...) for web images
                fit: BoxFit.cover, // makes image cover entire container
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
                const CircleAvatar(
                  radius: 20,
                  // backgroundImage: NetworkImage(
                  //   'https://via.placeholder.com/150',
                  // ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        '2h · 🌍',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Post Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'This is a sample post text. Having a great day! 🎉',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 12),

          // Post Image
          // Image.network(
          //   'https://via.placeholder.com/600x400',
          //   width: double.infinity,
          //   height: 300,
          //   fit: BoxFit.cover,
          // ),

          // Reactions Summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
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
                    const SizedBox(width: 4),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('❤', style: TextStyle(fontSize: 10)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${(index + 1) * 42}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  '${(index + 1) * 5} Comments · ${(index + 1) * 2} Shares',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
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
