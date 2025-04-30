import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Edit profile
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Stats
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('Orders', '12'),
                  _buildStat('Wishlist', '24'),
                  _buildStat('Reviews', '8'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Recent Orders
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Orders',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildOrderItem(
                    'Red Ceramic Mug Set',
                    'Delivered on April 20, 2024',
                    '\$59.99',
                  ),
                  const Divider(),
                  _buildOrderItem(
                    'Leather Wallet',
                    'In Transit',
                    '\$45.99',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Account Settings
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildSettingsTile(
                    'Payment Methods',
                    Icons.payment,
                    () {},
                  ),
                  const Divider(height: 1),
                  _buildSettingsTile(
                    'Shipping Addresses',
                    Icons.location_on,
                    () {},
                  ),
                  const Divider(height: 1),
                  _buildSettingsTile(
                    'Notifications',
                    Icons.notifications,
                    () {},
                  ),
                  const Divider(height: 1),
                  _buildSettingsTile(
                    'Privacy Settings',
                    Icons.privacy_tip,
                    () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement logout
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(String title, String subtitle, String price) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        price,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
