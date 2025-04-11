// data/source/banner_local_source.dart
import 'package:health_mate/src/home/data/models/banner_model.dart';

import 'package:flutter/material.dart';

class BannerLocalSource {
  List<BannerModel> getBanners() {
    return [
      const BannerModel(
        title: "Take Your First Consultant and Get 10% OFF",
        subtitle: "Coupon automatically apply on your first order",
        icon: "local_offer",
        image: "assets/images/take_consultant/1.png",
      ),
      const BannerModel(
        title: "Free Shipping on Orders Over \$50",
        subtitle: "Limited time offer. Shop now!",
        icon: 'local_shipping',
        image: "assets/images/take_consultant/1.png",
      ),
      const BannerModel(
        title: "Refer a Friend & Get \$5 OFF",
        subtitle: "Share the love and earn rewards",
        icon: "people",
        image: "assets/images/take_consultant/1.png",
      ),
    ];
  }
}
