import 'package:flutter/material.dart';

class AdFullScreen extends StatelessWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),

      body: const Center(
        child: Text('Already you can back or watch this screen'),
      ),
    );
  }
}