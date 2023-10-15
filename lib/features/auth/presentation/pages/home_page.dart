import 'package:flutter/material.dart';

import '../components/bottom_bar_bubble.dart';
import '../components/bottom_bar_item.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});


  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page"), backgroundColor: Colors.green,),
      bottomNavigationBar: BottomBarBubble(
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.chat),
          BottomBarItem(iconData: Icons.notifications),
          BottomBarItem(iconData: Icons.calendar_month),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          // implement your select function here
        },
      ),
      body: PageView(
        controller: controller,
        children: const <Widget>[
          Center(
            child: Text('First Page'),
          ),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          ),
          Center(
            child: Text('Four Page'),
          ),
          Center(
            child: Text('Five Page'),
          ),
        ],
      ),
    );
  }
}
