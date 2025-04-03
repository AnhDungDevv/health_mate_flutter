import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  icon: const Icon(Icons.arrow_back),
                ),
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
          children: [
            // Search bar
            const SearchInput(),
            const SizedBox(height: 10),
            // Category tabs
            ListView.builder(
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
              },
            ),
            const SizedBox(height: 16),
            // Consultant list
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildConsultantCard();
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onSelect,
        child: Chip(
          label: Text(title),
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildConsultantCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Consultant image
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // Replace with actual image URL
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
            // Pricing buttons
            Column(
              children: [
                _buildPriceButton('\$4.00 Chat', Colors.green),
                const SizedBox(height: 8),
                _buildPriceButton('\$14.00 Audio', Colors.blue),
                const SizedBox(height: 8),
                _buildPriceButton('\$24.00 Video', Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(100, 30),
      ),
      child: Text(text),
    );
  }
}
