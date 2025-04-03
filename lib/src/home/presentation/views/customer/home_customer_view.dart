import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/home/presentation/views/customer/consultant_tab_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/following_tab_view.dart';
import 'package:health_mate/src/search/presentation/views/search_consultant_nav.dart';
import 'package:health_mate/src/wallet/presentaion/widgets/balance_display.dart';

final tabProvider =
    StateProvider<ConsultantTab>((ref) => ConsultantTab.consultant);

enum ConsultantTab { consultant, following }

class HomeCustomerView extends ConsumerWidget {
  const HomeCustomerView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            _buildHeader(context),
            const SliverToBoxAdapter(child: SearchConsultantNav()),
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
    child: selectedTab == ConsultantTab.consultant
        ? const ConsultantTabView()
        : const FollowingTabView(),
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

Widget _buildHeader(BuildContext context) {
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
              const BalanceDisplay(),
              const SizedBox(width: 12),
              Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    // GlobalNavigator.showIncomingCallOverlay();
                    Navigator.pushNamed(
                        context, RoutesName.notificationCustomerView);
                  },
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
