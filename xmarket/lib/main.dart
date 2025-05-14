import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'providers/user_provider.dart';
import 'screens/checkout_page.dart';
import 'screens/login_page.dart';
import 'screens/main_screen.dart';
import 'screens/notifications_page.dart';
import 'screens/order_confirmation_page.dart';
import 'screens/payment_methods_page.dart';
import 'screens/privacy_settings_page.dart';
import 'screens/shipping_addresses_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MrXmarket(),
    ),
  );
}

class MrXmarket extends StatelessWidget {
  const MrXmarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Handmade Market',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/checkout': (context) {
          final cart = context.read<CartProvider>();
          return CheckoutPage(
            cartItems: cart.items,
            totalAmount: cart.totalAmount,
          );
        },
        '/order-confirmation': (context) => const OrderConfirmationPage(),
        '/payment-methods': (context) => const PaymentMethodsPage(),
        '/shipping-addresses': (context) => const ShippingAddressesPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/privacy-settings': (context) => const PrivacySettingsPage(),
      },
    );
  }
}
