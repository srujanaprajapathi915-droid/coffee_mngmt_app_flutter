import 'dart:math';
import 'package:flutter/material.dart';
import 'package:coffee_management_flutter/data/app_state.dart';
import 'package:coffee_management_flutter/screens/main_wrapper.dart';
import 'package:coffee_management_flutter/theme/app_theme.dart';

class OrderPlacedScreen extends StatelessWidget {
  final double amount;
  final String paymentMethod;
  const OrderPlacedScreen({super.key, required this.amount, required this.paymentMethod});

  void _goBackToHome(BuildContext context) {
    // Clear the cart
    AppState().clearCart();
    // Go back to Home wrapper, removing all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainWrapper()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Generate a random order ID
    final randomId = Random().nextInt(899999) + 100000;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Main Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Checkmark Circle
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 3),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Title
                  const Text(
                    'Order Placed! 🥳',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    paymentMethod == 'Cash on Delivery'
                        ? 'Your order of ₹${amount.toStringAsFixed(2)} has been placed successfully via Cash on Delivery.\nYour coffee is being prepared!'
                        : 'Your payment of ₹${amount.toStringAsFixed(2)} via $paymentMethod was successful.\nYour coffee is being prepared!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Info Box (Order ID & ETA)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order ID',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              '#CF$randomId',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'ETA',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              '20-25 mins',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Back to Home Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _goBackToHome(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD17842),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Back Arrow Icon (Top-Left) to return to Home (acts like Back to Home button)
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => _goBackToHome(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
