import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/home_page.dart';
import 'package:ui_one/features/auth/presentation/pages/notification_page.dart';
import 'package:ui_one/features/auth/presentation/pages/setting_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ui_one/features/auth/presentation/pages/ticket_history_page.dart';

import '../components/bottom_bar_bubble.dart';
import '../components/bottom_bar_item.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";

  const MainPage({super.key});


  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final PageController controller = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void selectTab(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_circle_sharp),
          onPressed: () {
            // Handle shopping cart button press
            selectTab(3);
          },
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomBarBubble(
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.receipt),
          BottomBarItem(iconData: Icons.notifications),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          // Call the selectTab function to navigate to the desired page
          selectTab(index);
        },
        selectedIndex: selectedIndex, // Pass the selected index to the BottomBarBubble
      ),
      body: PageView(
        controller: controller,
        children: const <Widget>[
          HomePage(),
          TicketHistoryPage(),
          NotificationPage(),
          SettingPage(),
        ],
      ),
    );
  }
}
