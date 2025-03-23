import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/onboarding_model.dart';

abstract class OnboardingLocalSource {
  Future<void> cacheOnboardingData(OnboardingModel data);
  Future<OnboardingModel?> getCachedOnboardingData();
}

class OnboardingLocalSourceImpl implements OnboardingLocalSource {
  @override
  Future<void> cacheOnboardingData(OnboardingModel data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('onboarding_cache', jsonEncode(data.toJson()));
  }

  @override
  Future<OnboardingModel?> getCachedOnboardingData() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('onboarding_cache');

    if (cachedData != null) {
      return OnboardingModel.fromJson(jsonDecode(cachedData));
    }
    return null;
  }
}
