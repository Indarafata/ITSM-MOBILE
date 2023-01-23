import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.onTap,
      required this.label,
      required this.icon});

  final Function()? onTap;
  final String label;
  // final Color textColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 25,
            ),
            Icon(icon),
            SizedBox(
              width: 50,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
