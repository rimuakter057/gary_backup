import 'package:flutter/material.dart';

class CustomRadioCard extends StatelessWidget {
  final String title;
  final String leadingText;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioCard({
    super.key,
    required this.title,
    required this.leadingText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          // Light mint/teal background
          color: const Color(0xFFE0F2F1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF00897B),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Blue Square Avatar
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF90CAF9),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                leadingText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Title Text
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF00695C), // Darker teal
                ),
              ),
            ),
            // The Custom Radio Button
            _buildCustomRadio(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadio() {
    return Container(
      height: 24,
      width: 24,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF00897B),
          width: 2,
        ),
      ),
      child: isSelected
          ? Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF00897B),
        ),
      )
          : null,
    );
  }
}