import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _orderUpdates = true;
  bool _promotions = true;
  bool _newProducts = false;
  bool _sellerMessages = true;
  bool _reviewReminders = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildNotificationSwitch(
                'Order Updates',
                'Get notified about your order status',
                _orderUpdates,
                (value) => setState(() => _orderUpdates = value),
              ),
              const Divider(height: 1),
              _buildNotificationSwitch(
                'Promotions',
                'Receive special offers and discounts',
                _promotions,
                (value) => setState(() => _promotions = value),
              ),
              const Divider(height: 1),
              _buildNotificationSwitch(
                'New Products',
                'Be the first to know about new items',
                _newProducts,
                (value) => setState(() => _newProducts = value),
              ),
              const Divider(height: 1),
              _buildNotificationSwitch(
                'Seller Messages',
                'Get notified when sellers message you',
                _sellerMessages,
                (value) => setState(() => _sellerMessages = value),
              ),
              const Divider(height: 1),
              _buildNotificationSwitch(
                'Review Reminders',
                'Reminders to review your purchases',
                _reviewReminders,
                (value) => setState(() => _reviewReminders = value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch(
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
