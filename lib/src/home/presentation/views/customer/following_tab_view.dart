import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FollowingTabView extends StatelessWidget {
  const FollowingTabView({super.key});
  final List<Map<String, String>> posts = const [
    {
      "name": "Dr. John Doe",
      "specialty": "Orthopedic Specialist · 5 min",
      "avatar": "assets/images/user_consultant/2.png",
      "content":
          "An honest endorsement of your product or service that usually comes from a customer",
      "image": "assets/images/posts/1.png",
      "likes": "65",
      "dislikes": "05"
    },
    {
      "name": "Dr. Jane Smith",
      "specialty": "Cardiologist · 10 min",
      "avatar": "assets/images/user_consultant/1.png",
      "content": "A great testimonial from a satisfied client.",
      "image": "assets/images/posts/1.png",
      "likes": "120",
      "dislikes": "10"
    },
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: posts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(1)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(post["avatar"]!),
                          ),
                          const SizedBox(
                              width: 10), // Replace spacing with SizedBox
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post["name"]!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post["specialty"]!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.more_vert)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post["content"]!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(post["image"]!)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        FontAwesomeIcons.arrowUp,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () {
                                        // Handle like action
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    post["likes"]!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        FontAwesomeIcons.arrowDown,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    post["dislikes"]!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    FontAwesomeIcons.share,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // Handle share action
                                  },
                                ),
                              ),
                              const SizedBox(width: 3),
                              const Text(
                                "Share",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
