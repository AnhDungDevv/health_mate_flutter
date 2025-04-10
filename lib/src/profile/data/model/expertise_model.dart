import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/profile/domain/entities/expertise_entity.dart';

part 'expertise_model.freezed.dart';
part 'expertise_model.g.dart';

@Freezed(unionKey: 'type')
sealed class ExpertiseModel with _$ExpertiseModel {
  const ExpertiseModel._();

  const factory ExpertiseModel.basic({
    String? id,
    required String category,
    required String videoURL,
    @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
    File? identityProofFile,
  }) = BasicExpertiseModel;

  factory ExpertiseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertiseModelFromJson(json);
}

extension ExpertiseModelX on ExpertiseModel {
  ExpertiseEntity toEntity() => switch (this) {
        BasicExpertiseModel e => ExpertiseEntity(
            id: e.id,
            category: e.category,
            videoURL: e.videoURL,
            identityProofFile: e.identityProofFile,
          ),
      };
}

File? _fileFromJson(String? path) {
  return path != null ? File(path) : null;
}

String? _fileToJson(File? file) {
  return file?.path;
}
