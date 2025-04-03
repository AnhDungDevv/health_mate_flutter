import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/presentaion/view/chat_list_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/my_consultant_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/home_customer_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/category_list_view.dart';
import 'package:health_mate/src/profile/presentaion/view/profile_view.dart';

final selectedViewProvider = StateProvider<int>((ref) => 0);

class MainLayoutCustomerView extends ConsumerWidget {
  const MainLayoutCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedViewProvider);

    // Danh sách các màn hình
    final List<Widget> screens = [
      const HomeCustomerView(),
      const CategoryConsultantView(),
      const MyConsultantView(),
      const ChatListView(),
      ProfileView(),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) => ref.read(selectedViewProvider.notifier).state = value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: "My Consult",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
