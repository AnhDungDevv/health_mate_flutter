import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/core/utils/app_assets.dart';
import 'package:health_mate/src/consultant/data/source/category_remote_source.dart';
import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';
import 'package:health_mate/src/consultant/domain/repository/category_repo.dart';

class InterestConsultantRepositoryImpl implements InterestConsultantRepository {
  final InterestConsultantRemoteSource remoteSource;

  InterestConsultantRepositoryImpl(this.remoteSource);
  List<CategoryEntity> mockConsultants = [
    const CategoryEntity(
        id: "1", name: "Astrologer", imageURL: AppAssets.astrologer),
    const CategoryEntity(id: "2", name: "Doctors", imageURL: AppAssets.doctor),
    const CategoryEntity(id: "3", name: "Lawyers", imageURL: AppAssets.lawyer),
    const CategoryEntity(
        id: "4", name: "Youtubers", imageURL: AppAssets.youtuber),
    const CategoryEntity(id: "5", name: "Tutors", imageURL: AppAssets.tutor),
    const CategoryEntity(
        id: "6", name: "Psychologist", imageURL: AppAssets.psychologist),
    const CategoryEntity(
        id: "7", name: "Psychologist", imageURL: AppAssets.psychologist),
    const CategoryEntity(
        id: "8", name: "Psychologist", imageURL: AppAssets.psychologist),
  ];

  @override
  Future<Either<Failure, List<CategoryEntity>>> getInterestConsultants() async {
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
