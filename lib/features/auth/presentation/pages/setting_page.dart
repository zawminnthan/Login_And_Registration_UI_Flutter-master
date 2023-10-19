import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'Setting',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}