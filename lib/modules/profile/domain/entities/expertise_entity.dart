import 'dart:io';

import 'package:health_mate/modules/profile/data/model/expertise_model.dart';

class ExpertiseEntity {
  final String? id;
  final String category;
  final String videoURL;
  final File? identityProofFile;

  ExpertiseEntity({
    this.id,
    required this.category,
    required this.videoURL,
    required this.identityProofFile,
  });
}

extension ExpertiseEntityMapper on ExpertiseEntity {
  ExpertiseModel toModel() {
    return ExpertiseModel(
      id: id,
      category: category,
      videoURL: videoURL,
      identityProofFile: identityProofFile,
    );
  }
}
