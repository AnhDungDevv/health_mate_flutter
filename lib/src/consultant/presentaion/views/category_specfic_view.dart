import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/search/presentation/widgets/search_input.dart';
import 'package:health_mate/src/service_options/presentaion/widgets/consultant_type_widget.dart';
import 'package:health_mate/src/wallet/presentaion/widgets/balance_display.dart';

class CategorySpecficView extends StatefulWidget {
  const CategorySpecficView({super.key});

  @override
  State<CategorySpecficView> createState() => _CategorySpecficViewState();
}

class _CategorySpecficViewState extends State<CategorySpecficView> {
  final List<String> categories = [
    'All',
    'Chest',
    'Genealogist',
    'Orthopedist',
    'Dental',
    'Heart',
  ];

  int selectedIndex = 0;
  void _onCategorySelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void showConsultantionTypeModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (context) => const ConsultationTypeWidget());
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> priceOptions = [
      {'price': '\$4.00', 'service': 'Chat', 'color': Colors.transparent},
      {'price': '\$14.00', 'service': 'Audio', 'color': Colors.transparent},
      {
        'price': '\$24.00',
        'service': 'Video',
        'color': Theme.of(context).colorScheme.primary
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, left: 0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Doctor',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                const BalanceDisplay(),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          children: [
            // Search bar
            const SearchInput(),
            // Category tabs
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _buildCategoryTab(
                      category,
                      isSelected: index == selectedIndex,
                      onSelect: () => _onCategorySelect(index),
                    );
                  }),
            ),

            const SizedBox(height: 16),
            // Consultant list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildConsultantCard(priceOptions);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title,
      {bool isSelected = false, required VoidCallback onSelect}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: RawChip(
        label: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        selected: isSelected,
        side: BorderSide.none,
        onPressed: onSelect,
        selectedColor: Colors.black,
        backgroundColor: Colors.grey[200],
        showCheckmark: false, // Bỏ icon check
      ),
    );
  }

  Widget _buildConsultantCard(priceOptions) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.consultantDetailView);
      },
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Consultant image
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    'assets/images/user_consultant/1.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                // Consultant details
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Anaya Satoshi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Clinical Psychologist\n12+ years of experience',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          Text('4.5 (13 reviews)'),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.verified,
                  color: Theme.of(context).colorScheme.primary,
                  size: 14,
                )
                // Pricing buttons
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: priceOptions.map<Widget>((option) {
                return _buildPriceButton(
                  option['price'] as String,
                  option['service'] as String,
                  option['color'] as Color,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceButton(String price, String service, Color color) {
    final isVideoService = service == 'Video';
    return GestureDetector(
      onTap: () {
        showConsultantionTypeModal(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 9),
        child: Row(
          spacing: 2,
          children: [
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isVideoService ? Colors.white : Colors.black,
              ),
            ),
            Text(
              service,
              style: TextStyle(
                fontSize: 12,
                color: isVideoService ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
