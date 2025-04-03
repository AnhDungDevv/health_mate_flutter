import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ConsultantTypeCard extends StatelessWidget {
  final String image;
  final String title;

  const ConsultantTypeCard({
    super.key,
    required this.image,
    required this.title,
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
              color: Colors.transparent,
              width: 2,
            ),
          ),
          child: ClipRRect(
            child: buildConsultantImage(image),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
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
