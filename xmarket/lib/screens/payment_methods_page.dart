import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  // List to store payment methods
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'title': 'Visa ending in 4242',
      'subtitle': 'Expires 12/25',
      'isDefault': true,
    },
    {
      'title': 'Mastercard ending in 8888',
      'subtitle': 'Expires 08/24',
      'isDefault': false,
    },
  ];

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _showAddCardDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Card'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(labelText: 'Card Number'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter card number' : null,
              ),
              TextFormField(
                controller: _expiryController,
                decoration: const InputDecoration(labelText: 'Expiry (MM/YY)'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter expiry date' : null,
              ),
              TextFormField(
                controller: _cvvController,
                decoration: const InputDecoration(labelText: 'CVV'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter CVV' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Add new card to the list
                setState(() {
                  _paymentMethods.add({
                    'title':
                        'Card ending in ${_cardNumberController.text.substring(_cardNumberController.text.length - 4)}',
                    'subtitle': 'Expires ${_expiryController.text}',
                    'isDefault': _paymentMethods
                        .isEmpty, // Make default if it's the first card
                  });
                });

                // Clear the form
                _cardNumberController.clear();
                _expiryController.clear();
                _cvvController.clear();

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Card added successfully!')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Payment Methods',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add New Card Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: _showAddCardDialog,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Add New Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            // Saved Cards
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildCardTile(
                    'Visa ending in 4242',
                    'Expires 12/25',
                    Icons.credit_card,
                    true,
                  ),
                  const Divider(height: 1),
                  _buildCardTile(
                    'Mastercard ending in 8888',
                    'Expires 08/24',
                    Icons.credit_card,
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTile(
    String title,
    String subtitle,
    IconData icon,
    bool isDefault,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isDefault
          ? const Chip(
              label: Text('Default'),
              backgroundColor: Colors.green,
              labelStyle: TextStyle(color: Colors.white),
            )
          : null,
    );
  }
}
