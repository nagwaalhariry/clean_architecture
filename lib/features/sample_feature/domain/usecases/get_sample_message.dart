import 'package:dartz/dartz.dart';

import '../../../../src/core/error/failures.dart';
import '../../../../src/core/usecase/base_usecase.dart';
import '../entities/sample_entity.dart';
import '../repositories/sample_repository.dart';

class GetSampleMessage extends BaseUseCase<SampleEntity, NoParams> {
  GetSampleMessage({required this.repository});

  final SampleRepository repository;

  @override
  Future<Either<Failure, SampleEntity>> call(NoParams params) {
    return repository.getSampleMessage();
  }
}
