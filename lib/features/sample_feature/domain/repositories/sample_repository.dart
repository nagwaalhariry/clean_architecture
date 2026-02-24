import 'package:dartz/dartz.dart';

import '../../../../src/core/error/failures.dart';
import '../entities/sample_entity.dart';

abstract class SampleRepository {
  Future<Either<Failure, SampleEntity>> getSampleMessage();
}
