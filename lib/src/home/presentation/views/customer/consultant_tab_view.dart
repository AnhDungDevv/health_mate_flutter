import 'package:flutter/material.dart';

class ConsultantTabView extends StatelessWidget {
  const ConsultantTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            _buildBanner(),

            const SizedBox(height: 16),

            // Categories Section
            _buildCategories(),

            const SizedBox(height: 16),

            // Recommended Section
            _buildSectionHeader("Recommended", onViewAll: () {}),
            const SizedBox(height: 8),
            _buildRecommended(),

            const SizedBox(height: 16),

            // Top Rated Section
            _buildSectionHeader("Top Rated Doctor", onViewAll: () {}),
            const SizedBox(height: 8),
            _buildTopRated(),

            const SizedBox(height: 16),

            // Refer and Earn Section
            _buildReferAndEarn(),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    final List<Map<String, dynamic>> banners = [
      {
        "title": "Take Your First Consultant and Get 10% OFF",
        "subtitle": "Coupon automatically applies on your first order",
        "icon": Icons.local_offer,
      },
      {
        "title": "Free Shipping on Orders Over \$50",
        "subtitle": "Limited time offer. Shop now!",
        "icon": Icons.local_shipping,
      },
      {
        "title": "Refer a Friend & Get \$5 OFF",
        "subtitle": "Share the love and earn rewards",
        "icon": Icons.people,
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
            width: 250,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        banner["title"] as String,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        banner["subtitle"] as String,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(banner["icon"],
                    color: Colors.orange, size: 40), // ✅ Dùng icon động
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ["Doctor", "Lawyer", "Mentor"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Choose your category", onViewAll: () {}),
        const SizedBox(height: 8),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child:
                        Icon(Icons.person, size: 30, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(categories[index]),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommended() {
    final recommended = [
      {"name": "Dr. Vinod Kumar", "specialty": "Orthopedic", "rating": 4.5},
      {"name": "Dr. Madhuri", "specialty": "Gynecologist", "rating": 4.8},
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = recommended[index];
          return Container(
            width: 150,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
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
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Text("${item["rating"]}"),
                  ],
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
        "specialty": "Clinical Psychologist",
        "rating": 4.9
      },
      {
        "name": "Dr. John Smith",
        "specialty": "Clinical Psychologist",
        "rating": 5.0
      },
      {
        "name": "Dr. John Smith",
        "specialty": "Clinical Psychologist",
        "rating": 4.8
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
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
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

  Widget _buildReferAndEarn() {
    return Container(
      padding: const EdgeInsets.all(16),
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
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onViewAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: const Text(
            "View all",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
