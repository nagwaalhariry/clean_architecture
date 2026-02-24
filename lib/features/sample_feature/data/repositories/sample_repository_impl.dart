import 'package:dartz/dartz.dart';

import '../../../../src/core/error/exceptions.dart';
import '../../../../src/core/error/failures.dart';
import '../../../../src/core/network/network_info.dart';
import '../../domain/entities/sample_entity.dart';
import '../../domain/repositories/sample_repository.dart';
import '../datasources/sample_remote_data_source.dart';

class SampleRepositoryImpl implements SampleRepository {
  SampleRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final SampleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, SampleEntity>> getSampleMessage() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('Device is offline.'));
    }

    try {
      final result = await remoteDataSource.getSampleMessage();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (_) {
      return const Left(UnknownFailure('Unknown error happened.'));
    }
  }
}
