import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/shared/styles/colors.dart';

class OnboardingSelection extends StatefulWidget {
  const OnboardingSelection({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OnboardingSelectionState();
  }
}

class _OnboardingSelectionState extends State<OnboardingSelection> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const Text(
                "Tell us who you are and how you'd like to engage with the app",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 20),
              _buildOptionCard(
                index: 0,
                title: "I am looking for Consultant",
                subtitle: "Search your best consultant around the world",
              ),
              const SizedBox(height: 20),
              _buildOptionCard(
                index: 1,
                title: "I am a Consultant Provider",
                subtitle: "Search your best consultant around the world",
              ),
            ],
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _selectedIndex == null
                  ? null
                  : () {
                      if (_selectedIndex == 0) {
                        context.push('/customer-info');
                      } else if (_selectedIndex == 1) {
                        context.push('/consultant-info');
                      }
                    },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = isSelected ? null : index; // Toggle selection
        });
      },
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.softPeach : AppColors.lightGray,
          border: Border.all(
            width: 1,
            color: isSelected ? AppColors.secondaryColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 59,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(CupertinoIcons.chat_bubble),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
