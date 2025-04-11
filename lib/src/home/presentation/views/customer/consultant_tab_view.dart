import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/consultant/presentaion/app/provider/category_provider.dart';
import 'package:health_mate/src/home/presentation/app/providers/banner_provider.dart';
import 'package:health_mate/src/home/presentation/app/providers/recommended_consultant_providers.dart';

class ConsultantTabView extends ConsumerWidget {
  const ConsultantTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildBannerListView(context, ref)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: _buildCategories(context, ref)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: _buildSectionHeader(context, "Recommended", onViewAll: () {}),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(child: _buildRecommended(context, ref)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: _buildSectionHeader(context, "Top Rated Doctor",
              onViewAll: () {}),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        _buildTopRated(context, ref),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: _buildReferAndEarn(context)),
      ],
    );
  }

  Widget _buildCategories(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(interestConsultantProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, "Choose your category", onViewAll: () {}),
        const SizedBox(height: 8),
        categoriesState.when(
          loading: () => const SizedBox(
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) {
            final failure = error as Failure;
            return SizedBox(
              height: 180,
              child: Center(
                child: Text('Lỗi: ${failure.message}'),
              ),
            );
          },
          data: (categories) => SizedBox(
            height: 180.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  width: 150.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(category.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withAlpha((0.7 * 255).toInt())
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            category.name, // giả sử `title` là tên category
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommended(BuildContext context, WidgetRef ref) {
    final recommendedList = ref.watch(recommendedConsultantListProvider);

    return recommendedList.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Lỗi: $e'),
      data: (consultants) {
        return SizedBox(
          height: 180.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: consultants.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = consultants[index];
              return Container(
                width: 150.w,
                height: 176.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: Theme.of(context).colorScheme.surface),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            item.consultant.image, // giả sử `image` là string
                            width: 60.w,
                            height: 60.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              color: item.isOnline ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.consultant.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.consultant.specialty,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          Text("${item.consultant.rating}"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTopRated(BuildContext context, WidgetRef ref) {
    final topRatedAsync = ref.watch(topConsultantListProvider);

    return topRatedAsync.when(
      data: (consultants) {
        print('TopRated consultants count: ${consultants.length}'); // Debug
        if (consultants.isEmpty) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 100.h,
              child: const Center(
                child: Text(
                  'No top-rated consultants available',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = consultants[index];
              return _buildTopRatedItem(context, item);
            },
            childCount: consultants.length,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: SizedBox(
          height: 100.h,
          child: Center(child: Text('Error: $err')),
        ),
      ),
    );
  }

  Widget _buildTopRatedItem(BuildContext context, dynamic item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  item.consultant.image ?? 'assets/images/default.png',
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    size: 60.w,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 15.w,
                  height: 15.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    color: item.isOnline ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.consultant.name ?? 'Unknown',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  item.consultant.specialty ?? 'No specialty',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              Text(
                "${item.consultant.rating ?? 0.0}",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReferAndEarn(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutesName.addfundsView),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                "Refer and Earn\nInvite your friend and get rewarded",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerListView(BuildContext context, WidgetRef ref) {
    final bannerState = ref.watch(bannerNotifierProvider);
    return bannerState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
      data: (banners) => SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemCount: banners.length,
          itemBuilder: (_, index) {
            final banner = banners[index];
            return Container(
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(banner.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((0.7 * 255).toInt()),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                banner.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  banner.subtitle,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(banner.icon, color: Colors.orange, size: 40),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha((0.6 * 255).toInt()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "1/4",
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title,
      {required VoidCallback onViewAll}) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: Text(
              "View all",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
