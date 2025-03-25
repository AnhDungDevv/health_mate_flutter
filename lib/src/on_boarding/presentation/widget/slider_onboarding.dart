import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';
import 'package:health_mate/src/on_boarding/presentation/app/notifier/onboarding_notifier.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

class SliderOnboarding extends ConsumerStatefulWidget {
  const SliderOnboarding({super.key});

  @override
  ConsumerState<SliderOnboarding> createState() => _SliderOnboardingState();
}

class _SliderOnboardingState extends ConsumerState<SliderOnboarding> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex =
      ValueNotifier<int>(0); // 🔹 Dùng ValueNotifier

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final onboardingData = onboardingState.data;

    if (onboardingState.isLoading || onboardingData.contents.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: 375.w,
      height: 450.h,
      child: Stack(
        children: [
          _buildBackgroundImage(onboardingData.image),
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.contents.length,
              onPageChanged: (index) => _currentIndex.value = index,
              itemBuilder: (context, index) => const SizedBox(),
            ),
          ),
          _buildContent(onboardingData),
          _buildPageIndicator(onboardingData.contents.length),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imagePath) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: imagePath.isNotEmpty
                  ? AssetImage(imagePath)
                  : const AssetImage("assets/images/default.png"),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 120.w,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
                        ])),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildContent(OnboardingEntity onboardingData) {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
      child: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (_, index, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Column(
              key: ValueKey(index),
              children: [
                Text(
                  onboardingData.contents[index].title,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2.sp,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
                Text(
                  onboardingData.contents[index].description,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator(int count) {
    return Positioned(
      bottom: 10.h,
      left: 0,
      right: 0,
      child: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (_, index, __) {
            return SmoothPageIndicator(
              controller: _pageController,
              count: count,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
                dotHeight: 3.h,
                dotWidth: 10.w,
              ),
            );
          },
        ),
      ),
    );
  }
}
