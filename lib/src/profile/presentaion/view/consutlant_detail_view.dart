import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultantDetailView extends StatelessWidget {
  const ConsultantDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DoctorsAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 72.w,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/user_consultant/2.png'), // Replace with actual image
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. John Smith',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 18)),
                      Text(
                        'Clinical Psychologist',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.verified,
                    color: Theme.of(context).colorScheme.primary,
                    size: 15,
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface),
                  child: const Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.work,
                        size: 15,
                      ),
                      Text(
                        '12+ years of experience',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface),
                  child: const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('4.5 (13 reviews)'),
                    ],
                  ),
                )
              ],
            ),

            // Follow and Consultation Buttons
            Row(
              spacing: 15,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      shadowColor: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text(
                    'Follow',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.scrim),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) =>
                            const ConsultantAvailabilitySheet(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                    child: const Text(
                      'Take a Consultation',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // About Consultant
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About Consultant',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 12)),
                Text(
                  'Dr. John Smith is a consultant doctor with 20 years of experience in the medical industry. He focuses on providing preventive health care and health education to help individuals and families stay healthy. He has a strong background in diagnosis and treatment of various medical conditions and is dedicated to helping people make the best healthcare decisions for their individual needs.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            // Introduction Video
            // const VideoIntroduceConsultant(),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.event_available,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    'View the consultant availability',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            // Other Services
            Text('Other Services',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Replace with actual service count
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface),
                    margin: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      width: 255.w,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    'assets/images/user_consultant/1.png', // Replace with the actual image path
                                    width: 70, // Set the width of the square
                                    height: 70, // Set the height of the square
                                    fit: BoxFit
                                        .cover, // Ensures the image covers the square
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Service Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700)),
                                    Text(
                                      'Description',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      '09 AM - 03 PM',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                child: Text(
                                  'Book the Service',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Reviews
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reviews',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.surface),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              Text('4.5'),
                            ],
                          ),
                          Text(
                            'Dr. John Smith is a consultant doctor with 20 years of experience in the medical industry. ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'John Doe',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DoctorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DoctorsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      leadingWidth: 30,
      title: Text('Doctors', style: Theme.of(context).textTheme.titleLarge),
      centerTitle: false,
      backgroundColor: Colors.white, // Màu nền AppBar
      elevation: 0,
      actions: [
        _buildActionIcon(
          icon: Icons.share,
          onTap: () {
            print('Share button tapped');
          },
        ),
        _buildActionIcon(
          icon: Icons.favorite_border,
          onTap: () {
            print('Favorite button tapped');
          },
        ),
        _buildActionIcon(
          icon: Icons.more_vert,
          onTap: () {
            print('Menu button tapped');
          },
        ),
      ],
    );
  }

  Widget _buildActionIcon(
      {required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200, // Màu nền của nút
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onTap, // Gọi hàm callback khi nhấn
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ConsultantAvailabilitySheet extends StatelessWidget {
  const ConsultantAvailabilitySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Consultant Availability',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildAvailabilityRow(
              context, 'Mon', '08:00 AM to 11:00 AM', '02:00 PM to 09:00 PM'),
          const SizedBox(height: 10),
          _buildAvailabilityRow(
              context, 'Fri', '08:00 AM to 11:00 AM', '02:00 PM to 09:00 PM'),
          const SizedBox(height: 16),
          const Text(
            '*The consultant availability may change. Always check before connect',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityRow(
      BuildContext context, String day, String time1, String time2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.check_box,
              color: Colors.green,
            ),
            const SizedBox(width: 8), // Thêm khoảng cách giữa icon và text
            Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 8,
          children: [
            Expanded(child: _buildTimeBox(context, time1)),
            Expanded(child: _buildTimeBox(context, time2)),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeBox(BuildContext context, String time) {
    return GestureDetector(
      onTap: () {
        _showOptions(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(time,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  void _showOptions(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(
                context,
                icon: Icons.call,
                title: 'Audio Call',
                price: '\$14.00/min',
              ),
              const SizedBox(height: 8),
              _buildOption(
                context,
                icon: Icons.videocam,
                title: 'Video Call',
                price: '\$21.00/min',
              ),
              const SizedBox(height: 8),
              _buildOption(
                context,
                icon: Icons.chat,
                title: 'Direct Chat',
                price: '\$10.00/2min',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon, required String title, required String price}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Đóng BottomSheet khi chọn
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $title')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(icon, color: Colors.orange),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
