import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _showProfile = true;
  bool _showOrders = true;
  bool _showReviews = true;
  bool _showWishlist = false;
  bool _showLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Privacy Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Privacy Settings
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Profile Visibility',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildPrivacySwitch(
                    'Show Profile to Public',
                    'Allow others to view your profile',
                    _showProfile,
                    (value) => setState(() => _showProfile = value),
                  ),
                  const Divider(height: 1),
                  _buildPrivacySwitch(
                    'Show Order History',
                    'Display your past purchases',
                    _showOrders,
                    (value) => setState(() => _showOrders = value),
                  ),
                  const Divider(height: 1),
                  _buildPrivacySwitch(
                    'Show Reviews',
                    'Display your product reviews',
                    _showReviews,
                    (value) => setState(() => _showReviews = value),
                  ),
                  const Divider(height: 1),
                  _buildPrivacySwitch(
                    'Show Wishlist',
                    'Display your saved items',
                    _showWishlist,
                    (value) => setState(() => _showWishlist = value),
                  ),
                  const Divider(height: 1),
                  _buildPrivacySwitch(
                    'Show Location',
                    'Display your general location',
                    _showLocation,
                    (value) => setState(() => _showLocation = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Data Management
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Management',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.download),
                    title: const Text('Download My Data'),
                    onTap: () {
                      // TODO: Implement data download
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data download feature coming soon!'),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Delete Account'),
                    onTap: () {
                      // TODO: Implement account deletion
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Account deletion feature coming soon!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySwitch(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }
}
