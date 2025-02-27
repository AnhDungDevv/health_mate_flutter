import 'package:flutter/material.dart';

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectInterestScreenState();
  }
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {
  final List<String> _categoryTitles = [
    'Astrologer',
    'Doctors',
    'Lawyers',
    'YouTubers',
    'Tutors',
    'Psychologist',
    'Lawyers',
    'YouTubers',
    'Tutors',
    'Psychologist',
  ];
  final List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemCount: _categoryTitles.length, // Số lượng mục
                itemBuilder: (context, index) {
                  final isSelected =
                      _selectedCategories.contains(_categoryTitles[index]);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? _selectedCategories.remove(_categoryTitles[index])
                            : _selectedCategories.add(_categoryTitles[index]);
                      });
                    },
                    child: CategoryCard(
                        image: 'assets/image${index + 1}.jpg', // Thêm ảnh ở đây
                        title: _categoryTitles[index], // Tiêu đề của từng mục
                        isSelected: isSelected),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;

  const CategoryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? Colors.blue
                  : Colors.transparent, // Hiển thị viền khi chọn
              width: 3,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? Colors.blue
                : Colors.black, // Thay đổi màu chữ khi chọn
          ),
        ),
      ],
    );
  }
}
