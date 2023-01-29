import 'package:flutter/material.dart';

class BodyStory extends StatefulWidget {
  const BodyStory({super.key});

  @override
  State<BodyStory> createState() => _BodyStoryState();
}

class _BodyStoryState extends State<BodyStory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showSimpleModalDialog(context),
        child: const Text('open modal'),
      ),
    );
  }

  _foo() {}

  _showSimpleModalDialog(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const Center(child: Text('Coming soon')),
    );
  }
}
