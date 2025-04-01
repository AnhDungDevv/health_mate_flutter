import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/home/presentation/views/customer/consultant_tab_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/following_tab_view.dart';

final tabProvider =
    StateProvider<ConsultantTab>((ref) => ConsultantTab.consultant);

enum ConsultantTab { consultant, following }

class HomeCustomerView extends ConsumerWidget {
  const HomeCustomerView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            _buildSearch(context),
            _buildTabSelector(ref),
            _buildTabContent(ref)
          ],
        ),
      ),
    );
  }
}

Widget _buildTabContent(WidgetRef ref) {
  final selectedTab = ref.watch(tabProvider);

  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: selectedTab == ConsultantTab.consultant
          ? const ConsultantTabView()
          : const FollowingTabView(),
    ),
  );
}

Widget _buildTabSelector(WidgetRef ref) {
  final selectedTab = ref.watch(tabProvider);
  return SliverToBoxAdapter(
    child: Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    backgroundColor: selectedTab == ConsultantTab.consultant
                        ? Colors.black
                        : Colors.grey[200],
                    foregroundColor: selectedTab == ConsultantTab.consultant
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    ref.read(tabProvider.notifier).state =
                        ConsultantTab.consultant;
                  },
                  child: const Text("Consultant"))),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                backgroundColor: selectedTab == ConsultantTab.following
                    ? Colors.black
                    : Colors.grey[200],
                foregroundColor: selectedTab == ConsultantTab.following
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () {
                ref.read(tabProvider.notifier).state = ConsultantTab.following;
              },
              child: const Text("Following"),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSearch(BuildContext context) {
  return SliverToBoxAdapter(
      child: GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, RoutesName.searchView);
    },
    child: Container(
      height: 50,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text(
            'Search for consultant',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  ));
}

Widget _buildHeader() {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello , John Doe',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              Text(
                'Find your Consultant',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: AppColors.secondary,
                      size: 16,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '100.06',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 25,
                      weight: 400,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
