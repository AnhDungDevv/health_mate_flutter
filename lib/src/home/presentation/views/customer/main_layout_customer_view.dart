import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/presentation/views/home_customer_view.dart';

final selectedViewProvider = StateProvider<int>((ref) => 0);

class MainLayoutCustomerView extends ConsumerWidget {
  const MainLayoutCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedViewProvider);

    // Danh sách các màn hình
    final List<Widget> screens = [
      const HomeCustomerView(),
      const Center(child: Text("Category Screen")),
      const Center(child: Text("My Consult Screen")),
      const Center(child: Text("Message Screen")),
      const Center(child: Text("Profile Screen")),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
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
