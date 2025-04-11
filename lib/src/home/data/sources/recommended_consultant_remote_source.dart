import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/home/data/models/recommended_consultant_model.dart';

class RecommendedConsultantRemoteSource {
  final Dio _dio = ApiClient().dio;

  RecommendedConsultantRemoteSource();

  Future<List<ConsultantPreviewModel>> fetchRecommendedConsultants() async {
    // final response = await _dio.get('/recommended-consultants');
    // final data = response.data as List;
    // return data.map((e) => ConsultantPreviewModel.fromJson(e)).toList();
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const ConsultantPreviewModel(
        id: '1',
        name: 'Dr. Vinod Kumar',
        image: 'assets/images/user_consultant/1.png',
        specialty: 'Orthopedic',
        rating: 4.5,
      ),
      const ConsultantPreviewModel(
        id: '2',
        name: 'Dr. Madhuri',
        image: 'assets/images/user_consultant/1.png',
        specialty: 'Gynecologist',
        rating: 4.8,
      ),
    ];
  }

  Future<List<ConsultantPreviewModel>> fetchTopRatedConsultants() async {
    // final response = await _dio.get('/top-rated-consultants');
    // final data = response.data as List;
    // return data.map((e) => ConsultantPreviewModel.fromJson(e)).toList();
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const ConsultantPreviewModel(
        id: '1',
        name: 'Dr. John Smith',
        image: 'assets/images/user_consultant/1.png',
        specialty: 'Clinical Psychologist',
        rating: 4.9,
      ),
      const ConsultantPreviewModel(
        id: '2',
        name: 'Dr. Jane Doe',
        image: 'assets/images/user_consultant/2.png',
        specialty: 'Therapist',
        rating: 5.0,
      ),
      const ConsultantPreviewModel(
        id: '3',
        name: 'Dr. Alex Green',
        image: 'assets/images/user_consultant/3.png',
        specialty: 'Mental Health Expert',
        rating: 4.8,
      ),
    ];
  }
}
