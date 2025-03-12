import 'dart:io';

import 'package:health_mate/modules/profile/domain/entities/expertise_entity.dart';

class ExpertiseModel extends ExpertiseEntity {
  @override
  final File? identityProofFile;

  ExpertiseModel({
    required super.category,
    required super.videoURL,
    this.identityProofFile,
    String? id,
  }) : super(
          id: id,
          identityProofFile: identityProofFile,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category": category,
      "videoURL": videoURL,
      "identityProofFile": identityProofFile?.path,
    };
  }

  factory ExpertiseModel.fromJson(Map<String, dynamic> json) {
    return ExpertiseModel(
      id: json["id"],
      category: json["category"],
      videoURL: json["videoURL"],
      identityProofFile: json["identityProofFile"] != null
          ? File(json["identityProofFile"])
          : null,
    );
  }
}

extension ExpertiseModelMapper on ExpertiseModel {
  ExpertiseEntity toEntity() {
    return ExpertiseEntity(
      id: id,
      category: category,
      videoURL: videoURL,
      identityProofFile: identityProofFile,
    );
  }
}
