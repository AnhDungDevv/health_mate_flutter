import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class ConsultantTabView extends StatelessWidget {
  const ConsultantTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildBanner()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: _buildCategories(context)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: _buildSectionHeader(context, "Recommended", onViewAll: () {}),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(child: _buildRecommended()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: _buildSectionHeader(context, "Top Rated Doctor",
              onViewAll: () {}),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(child: _buildTopRated()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: _buildReferAndEarn(context)),
      ],
    );
  }

  Widget _buildBanner() {
    final List<Map<String, dynamic>> banners = [
      {
        "title": "Take Your First Consultant and Get 10% OFF",
        "subtitle": "Coupon automatically apply on your first order",
        "icon": Icons.local_offer,
        "image": "assets/images/take_consultant/1.png",
      },
      {
        "title": "Free Shipping on Orders Over \$50",
        "subtitle": "Limited time offer. Shop now!",
        "icon": Icons.local_shipping,
        "image": "assets/images/take_consultant/1.png",
      },
      {
        "title": "Refer a Friend & Get \$5 OFF",
        "subtitle": "Share the love and earn rewards",
        "icon": Icons.people,
        "image": "assets/images/take_consultant/1.png",
      },
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Container(
            width: 300.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(banner["image"] as String),
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
                              banner["title"] as String,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                banner["subtitle"] as String,
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
                      Icon(banner["icon"], color: Colors.orange, size: 40),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = [
      {"title": "Doctor", "image": "assets/images/category/cate1.png"},
      {"title": "Lawyer", "image": "assets/images/category/cate2.png"},
      {"title": "Mentor", "image": "assets/images/category/cate3.png"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, "Choose your category", onViewAll: () {}),
        const SizedBox(height: 8),
        SizedBox(
          height: 180.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return Container(
                width: 150.w,
                height: 180.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(categories[index]["image"].toString()),
                      fit: BoxFit.cover,
                    )),
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
                                ])),
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
                          categories[index]["title"].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommended() {
    final recommended = [
      {
        "name": "Dr. Vinod Kumar",
        "image": "assets/images/user_consultant/1.png",
        "specialty": "Orthopedic",
        "rating": 4.5,
        "online": true
      },
      {
        "name": "Dr. Madhuri",
        "image": "assets/images/user_consultant/1.png",
        "specialty": "Gynecologist",
        "rating": 4.8,
        "online": false
      },
    ];

    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = recommended[index];
          return Container(
            width: 150.w,
            height: 176.h,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Theme.of(context).colorScheme.surface),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        item["image"] as String,
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
                          color: item["online"] as bool
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item["name"] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  item["specialty"] as String,
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
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text("${item["rating"]}"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopRated() {
    final topRated = [
      {
        "name": "Dr. John Smith",
        "image": "assets/images/user_consultant/1.png",
        "specialty": "Clinical Psychologist",
        "rating": 4.9,
        "online": true
      },
      {
        "name": "Dr. John Smith",
        "image": "assets/images/user_consultant/1.png",
        "specialty": "Clinical Psychologist",
        "rating": 5.0,
        "online": false
      },
      {
        "name": "Dr. John Smith",
        "image": "assets/images/user_consultant/1.png",
        "specialty": "Clinical Psychologist",
        "rating": 4.8,
        "online": true
      },
    ];

    return Column(
      children: List.generate(topRated.length, (index) {
        final item = topRated[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha((0.2 * 255).toInt()),
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
                      item["image"] as String,
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
                        color:
                            item["online"] as bool ? Colors.green : Colors.red,
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
                      item["name"] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item["specialty"] as String,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  Text("${item["rating"]}"),
                ],
              ),
            ],
          ),
        );
      }),
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
