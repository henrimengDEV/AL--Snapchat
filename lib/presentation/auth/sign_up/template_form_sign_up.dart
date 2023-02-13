import 'package:flutter/material.dart';

class TemplateFormSignUp extends StatelessWidget {
  final String label;
  final Widget child;

  const TemplateFormSignUp({
    Key? key,
    required this.child,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              child
            ],
          ),
        ),
      ),
    );
  }
}
