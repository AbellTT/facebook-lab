import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildProfileCard(),
                const SizedBox(height: 1),
                _buildCreatePageButton(),
                const SizedBox(height: 16),
                _buildShortcutsGrid(),
                const SizedBox(height: 12),
                _buildSeeMoreButton(),
                const SizedBox(height: 16),
                _buildExpansionSection(
                  icon: Icons.help_outline,
                  title: "Help and support",
                ),
                _buildExpansionSection(
                  icon: Icons.settings_outlined,
                  title: "Settings and privacy",
                ),
                _buildExpansionSection(
                  icon: Icons.business_center_outlined,
                  title: "Professional access",
                  isExpanded: true,
                  content: _buildMetaVerifiedCard(),
                ),
                _buildExpansionSection(
                  icon: Icons.grid_view,
                  title: "Also from Meta",
                  content: _buildMetaLinks(),
                ),
                const SizedBox(height: 16),
                _buildLogoutButton(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Menu',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
          ),
          Row(
            children: [
              _buildIconButton(Icons.settings),
              const SizedBox(width: 8),
              _buildIconButton(Icons.search),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: () {},
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/image/2.png'),
          ),
          const SizedBox(width: 12),
          const Text(
            'Abel Teferi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreatePageButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Text(
            'Create Facebook Page',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShortcutsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.9,
      children: [
        _buildShortcutTile(
          Icons.movie_creation_outlined,
          "Edits",
          color: Colors.pink,
        ),
        _buildShortcutTile(Icons.history, "Memories", color: Colors.blue),
        _buildShortcutTile(Icons.bookmark, "Saved", color: Colors.purple),
        _buildShortcutTile(Icons.group, "Groups", color: Colors.blue),
        _buildShortcutTile(Icons.ondemand_video, "Reels", color: Colors.red),
        _buildShortcutTile(Icons.store, "Marketplace", color: Colors.blue),
        _buildShortcutTile(
          Icons.person_add_outlined,
          "Friends",
          subtitle: "(27 online)",
          color: Colors.blue,
        ),
        _buildShortcutTile(Icons.feed_outlined, "Feeds", color: Colors.blue),
      ],
    );
  }

  Widget _buildShortcutTile(
    IconData icon,
    String title, {
    String? subtitle,
    Color color = Colors.blue,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            ),
        ],
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'See more',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildExpansionSection({
    required IconData icon,
    required String title,
    bool isExpanded = false,
    Widget? content,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        leading: Icon(icon, color: Colors.grey.shade700, size: 28),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        tilePadding: EdgeInsets.zero,
        expandedAlignment: Alignment.centerLeft,
        children: content != null ? [content] : [],
      ),
    );
  }

  Widget _buildMetaVerifiedCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image/3.png',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 12,
                bottom: -15,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Meta Verified',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            'Build trust with a verified badge.',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaLinks() {
    return Column(
      children: [
        _buildMetaLinkItem(
          Icons.movie_creation_outlined,
          "Edits",
          color: Colors.pink,
        ),
        _buildMetaLinkItem(
          FontAwesomeIcons.threads,
          "Threads",
          color: Colors.black,
        ),
        _buildMetaLinkItem(
          FontAwesomeIcons.instagram,
          "Instagram",
          color: Colors.orange,
        ),
        _buildMetaLinkItem(
          Icons.flash_on_outlined,
          "Free Basics",
          color: Colors.purple,
        ),
        _buildMetaLinkItem(
          FontAwesomeIcons.facebookMessenger,
          "Messenger",
          color: Colors.blue,
        ),
        _buildMetaLinkItem(
          FontAwesomeIcons.whatsapp,
          "WhatsApp",
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildMetaLinkItem(
    IconData icon,
    String label, {
    Color color = Colors.blue,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Log out',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
