import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/core/common/styles/colors.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {super.key,
      required this.role,
      required this.isSelected,
      required this.title,
      required this.subtitle,
      required this.onSelect});
  final Role role;
  final bool isSelected;
  final String title;
  final String subtitle;
  final ValueChanged<Role> onSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(role),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.softPeach : AppColors.lightGrey,
          border: Border.all(
              width: isSelected ? 2 : 2,
              color:
                  isSelected ? AppColors.secondaryColor : AppColors.lightGrey),
          borderRadius: BorderRadius.circular(isSelected ? 5 : 1),
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
                child: Icon(
                  role == Role.customer
                      ? FontAwesomeIcons.comment
                      : FontAwesomeIcons.user,
                  color: isSelected ? AppColors.secondaryColor : AppColors.text,
                ),
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
