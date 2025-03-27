import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:health_mate/core/common/styles/colors.dart';

class SelectInterestCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;

  const SelectInterestCard({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.secondaryColor : Colors.transparent,
              width: isSelected ? 3 : 2,
            ),
          ),
          child: ClipRRect(
            child: buildConsultantImage(image),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.secondaryColor : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildConsultantImage(String imageUrl) {
    if (imageUrl.startsWith("http")) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red),
      );
    } else {
      return Image.asset(imageUrl, fit: BoxFit.cover);
    }
  }
}
