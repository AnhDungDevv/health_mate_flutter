import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_mate/core/constants/assets.dart';
import 'package:health_mate/modules/auth/data/dummydata/dummy_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

class SliderOnboarding extends StatefulWidget {
  const SliderOnboarding({super.key});

  @override
  State<StatefulWidget> createState() => _SliderOnboardingState();
}

class _SliderOnboardingState extends State<SliderOnboarding> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? _timer;

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      if (mounted) {
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage(Assets.onboarding),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 80,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Column(
              key: ValueKey(currentIndex),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    onboardingPageData[currentIndex].title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  onboardingPageData[currentIndex].description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: PageView.builder(
            controller: _pageController,
            itemCount: onboardingPageData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index; // Chỉ thay đổi nội dung chữ
              });
              _startAutoScroll();
            },
            itemBuilder: (context, index) {
              return const SizedBox(); // Không hiển thị gì trong PageView vì chỉ dùng để điều khiển chữ
            },
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardingPageData.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
                dotHeight: 5,
                dotWidth: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
