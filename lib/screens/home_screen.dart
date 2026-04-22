import 'package:flutter/material.dart';
import 'chat_list_screen.dart';
import 'ai_chat_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const ChatListScreen(),
    const AIChatScreen(),
    const SettingsScreen(),
  ];
  
  final List<NavigationDestination> _destinations = [
    const NavigationDestination(
      icon: Icon(Icons.chat_bubble_outline),
      selectedIcon: Icon(Icons.chat_bubble),
      label: '消息',
    ),
    const NavigationDestination(
      icon: Icon(Icons.smart_toy_outlined),
      selectedIcon: Icon(Icons.smart_toy),
      label: 'AI助手',
    ),
    const NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: '设置',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: _destinations,
      ),
    );
  }
}
