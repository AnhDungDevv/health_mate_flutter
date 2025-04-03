import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {
      'title': 'My Wallet',
      'subtitle': 'View and manage your all wallet',
      'onTap': RoutesName.myWalletView,
    },
    {
      'title': 'My Consult',
      'subtitle': 'View and manage your all consult',
      'onTap': RoutesName.myConsultView,
    },
    {
      'title': 'My Recordings',
      'subtitle': 'Play all your video and audio recording',
      'onTap': RoutesName.myRecordingsView,
    },
    {
      'title': 'My Favorite',
      'subtitle': 'View and manage your favorite consultant',
      'onTap': RoutesName.myFavoriteView,
    },
    {
      'title': 'Message',
      'subtitle': 'View and reply to your chats',
      'onTap': RoutesName.chatListView,
    },
    {
      'title': 'Refer and Earn',
      'subtitle': 'Refer your friend and earn money',
      'onTap': RoutesName.referAndEarnView,
    },
    {
      'title': 'Settings',
      'subtitle': 'View and manage your all settings',
      'onTap': RoutesName.settingsView,
    },
    {
      'title': 'Terms of Service',
      'subtitle': 'View all privacy policy',
      'onTap': RoutesName.termsOfServiceView,
    },
    {
      'title': 'Help & Support',
      'subtitle': 'Take help for your related queries',
      'onTap': RoutesName.helpAndSupportView,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage('https://example.com/profile.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'John William Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '+91-9541281779',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // Handle settings action
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Column(
                      children: [
                        Text(
                          'Total available amount',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$125.23',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return _buildListTile(
                      context,
                      item['title']!,
                      item['subtitle']!,
                      item['onTap'],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Become a Consultant?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Simple fill the form and start earning from day 1',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, String subtitle, String? routeName) {
    return GestureDetector(
      onTap: routeName != null
          ? () {
              Navigator.pushNamed(context, routeName);
            }
          : null, // Prevent null route navigation
      child: ListTile(
        leading: const Icon(Icons.circle, size: 10, color: Colors.grey),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
