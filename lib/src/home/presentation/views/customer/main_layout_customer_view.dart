import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/presentaion/view/chat_list_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/my_consultant_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/home_customer_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/category_list_view.dart';
import 'package:health_mate/src/profile/presentaion/view/profile_view.dart';

final selectedViewProvider = StateProvider<int>((ref) => 0);
final loadedTabsProvider =
    StateProvider<Set<int>>((ref) => {0}); // Mặc định load tab 0

class MainLayoutCustomerView extends ConsumerWidget {
  const MainLayoutCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedViewProvider);
    final loadedTabs = ref.watch(loadedTabsProvider);

    // Load tab khi được mở
    ref.listen(selectedViewProvider, (prev, next) {
      final current = ref.read(loadedTabsProvider);
      if (!current.contains(next)) {
        ref.read(loadedTabsProvider.notifier).state = {...current, next};
      }
    });

    // Build từng tab khi được mở
    final List<Widget> tabs = List.generate(5, (index) {
      if (loadedTabs.contains(index)) {
        switch (index) {
          case 0:
            return const HomeCustomerView();
          case 1:
            return const CategoryConsultantView();
          case 2:
            return const MyConsultantView();
          case 3:
            return const ChatListView();
          case 4:
            return ProfileView();
        }
      }
      return const SizedBox();
    });

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0.1, 0.0), end: Offset.zero)
                      .animate(animation),
              child: child,
            ),
          );
        },
        child: tabs[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(selectedViewProvider.notifier).state = index;
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
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
