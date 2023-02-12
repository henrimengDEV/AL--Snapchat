import 'package:flutter/material.dart';

class Optional extends StatelessWidget {
  final bool predicate;
  final Widget children;

  const Optional({
    Key? key,
    required this.predicate,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (predicate) {
      return children;
    }

    return const Center(child: CircularProgressIndicator());
  }
}
