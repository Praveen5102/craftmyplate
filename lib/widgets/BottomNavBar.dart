import 'package:flutter/material.dart' as material; // Using alias for Flutter Material
import 'package:fluent_ui/fluent_ui.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: material.Colors.white, // Using material.Colors
        boxShadow: [
          BoxShadow(
            color: material.Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(FluentIcons.reservation_orders, 'Orders'),
                _buildNavItem(FluentIcons.birthday_cake, 'Events'),
                SizedBox(width: 60), // Space for center logo
                _buildNavItem(FluentIcons.gift_box_solid ,'Submit Leads'),
                _buildNavItem(FluentIcons.gift_card, 'Offers'),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF460F7E),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF460F7E).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Icon(
            icon,
            color: material.Colors.grey, // Using material.Colors
            size: 24,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: material.Colors.grey, // Using material.Colors
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
