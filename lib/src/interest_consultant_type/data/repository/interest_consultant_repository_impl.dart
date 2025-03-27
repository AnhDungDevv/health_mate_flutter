import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/core/utils/app_assets.dart';
import 'package:health_mate/src/interest_consultant_type/data/source/interest_consultant_remote_source.dart';
import 'package:health_mate/src/interest_consultant_type/domain/entities/consultant_type_entity.dart';
import 'package:health_mate/src/interest_consultant_type/domain/repository/interest_consultant_repository.dart';

class InterestConsultantRepositoryImpl implements InterestConsultantRepository {
  final InterestConsultantRemoteSource remoteSource;

  InterestConsultantRepositoryImpl(this.remoteSource);
  List<ConsultantTypeEntity> mockConsultants = [
    const ConsultantTypeEntity(
        id: "1", name: "Astrologer", imageURL: AppAssets.astrologer),
    const ConsultantTypeEntity(
        id: "2", name: "Doctors", imageURL: AppAssets.doctor),
    const ConsultantTypeEntity(
        id: "3", name: "Lawyers", imageURL: AppAssets.lawyer),
    const ConsultantTypeEntity(
        id: "4", name: "Youtubers", imageURL: AppAssets.youtuber),
    const ConsultantTypeEntity(
        id: "5", name: "Tutors", imageURL: AppAssets.tutor),
    const ConsultantTypeEntity(
        id: "6", name: "Psychologist", imageURL: AppAssets.psychologist),
    const ConsultantTypeEntity(
        id: "7", name: "Psychologist", imageURL: AppAssets.psychologist),
    const ConsultantTypeEntity(
        id: "8", name: "Psychologist", imageURL: AppAssets.psychologist),
  ];

  @override
  Future<Either<Failure, List<ConsultantTypeEntity>>>
      getInterestConsultants() async {
    return Right(mockConsultants);
    // try {
    //   final interestConsultantTypes = await remoteSource.fetchConsultantTypes();
    //   return Right(interestConsultantTypes);
    // } on DioException catch (e) {
    //   return Left(ErrorHandler.handleDioError(e));
    // } catch (e) {
    //   return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    // }
  }

  @override
  Future<void> postSelectedInterests(
      String userId, List<String> interests) async {
    return await remoteSource.postSelectedInterests(userId, interests);
  }
}
