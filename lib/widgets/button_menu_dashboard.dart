import 'package:flutter/material.dart';

class ButtonMenuDashboard extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  const ButtonMenuDashboard(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
