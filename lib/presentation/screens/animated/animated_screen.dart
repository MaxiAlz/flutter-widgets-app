import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animated'),
      ),
      body: const Placeholder(),
    );
  }
}
