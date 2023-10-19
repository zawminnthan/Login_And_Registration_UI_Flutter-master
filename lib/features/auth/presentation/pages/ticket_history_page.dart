import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/home_page.dart';

class TicketHistoryPage extends StatelessWidget {
  const TicketHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'Ticket History',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}