import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cartItems;
  final double totalAmount;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();
  String _selectedPaymentMethod = 'Credit Card';

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  String get _fullAddress {
    return '${_addressController.text}, ${_cityController.text}, ${_zipController.text}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep++);
          } else {
            _processOrder();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
            title: const Text('Shipping'),
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      labelText: 'Street Address',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Please enter your address'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Please enter your city'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _zipController,
                    decoration: const InputDecoration(
                      labelText: 'ZIP Code',
                      prefixIcon: Icon(Icons.pin),
                    ),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Please enter ZIP code' : null,
                  ),
                ],
              ),
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Payment'),
            content: Column(
              children: [
                RadioListTile(
                  title: const Text('Credit Card'),
                  value: 'Credit Card',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() => _selectedPaymentMethod = value.toString());
                  },
                ),
                RadioListTile(
                  title: const Text('PayPal'),
                  value: 'PayPal',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() => _selectedPaymentMethod = value.toString());
                  },
                ),
                RadioListTile(
                  title: const Text('Apple Pay'),
                  value: 'Apple Pay',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() => _selectedPaymentMethod = value.toString());
                  },
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Review'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...widget.cartItems.map((item) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        item.product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.product.name),
                      subtitle: Text('Quantity: ${item.quantity}'),
                      trailing: Text(
                        '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${widget.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

  void _processOrder() {
    if (_formKey.currentState?.validate() ?? false) {
      final cartProvider = Provider.of<CartProvider>(context, listen: false);

      // Generate a random order ID (in a real app, this would come from the backend)
      final orderId =
          'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

      // Clear the cart
      cartProvider.clear();

      // Navigate to order confirmation
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/order-confirmation',
        (route) => false,
        arguments: {
          'orderId': orderId,
          'totalAmount': widget.totalAmount,
          'shippingAddress': _fullAddress,
        },
      );
    }
  }
}
