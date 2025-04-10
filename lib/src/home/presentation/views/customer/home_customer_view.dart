import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/home/presentation/views/customer/consultant_tab_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/following_tab_view.dart';
import 'package:health_mate/src/search/presentation/views/search_consultant_nav.dart';
import 'package:health_mate/src/wallet/presentaion/widgets/balance_display.dart';

final tabProvider =
    StateProvider<ConsultantTab>((ref) => ConsultantTab.consultant);

enum ConsultantTab { consultant, following }

class HomeCustomerView extends ConsumerStatefulWidget {
  const HomeCustomerView({super.key});

  @override
  ConsumerState<HomeCustomerView> createState() => _HomeCustomerViewState();
}

class _HomeCustomerViewState extends ConsumerState<HomeCustomerView> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(tabProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: _buildHeader(context, ref)),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                const SliverToBoxAdapter(child: SearchConsultantNav()),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverToBoxAdapter(child: _buildTabSelector(ref)),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
              ];
            },
            body: selectedTab == ConsultantTab.consultant
                ? const ConsultantTabView()
                : const FollowingTabView(),
          ),
        ),
      ),
    );
  }
}

Widget _buildTabSelector(WidgetRef ref) {
  final selectedTab = ref.watch(tabProvider);
  return Row(
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
            ref.read(tabProvider.notifier).state = ConsultantTab.consultant;
          },
          child: const Text("Consultant"),
        ),
      ),
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
  );
}

Widget _buildHeader(BuildContext context, WidgetRef ref) {
  final authState = ref.watch(authNotifierProvider);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authState.when(
            data: (state) {
              final userName = state.authData?.user.name;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $userName',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    'Find your Consultant',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, stack) => const Text('Some error'),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                Navigator.pushNamed(
                    context, RoutesName.notificationCustomerView);
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.notifications_outlined,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      )
    ],
  );
}
