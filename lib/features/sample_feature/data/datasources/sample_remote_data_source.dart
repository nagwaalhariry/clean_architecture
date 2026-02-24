import '../../../../src/core/error/exceptions.dart';
import '../models/sample_model.dart';

abstract class SampleRemoteDataSource {
  Future<SampleModel> getSampleMessage();
}

class SampleRemoteDataSourceImpl implements SampleRemoteDataSource {
  @override
  Future<SampleModel> getSampleMessage() async {
    // Template stub: replace with real API call implementation.
    await Future<void>.delayed(const Duration(milliseconds: 250));

    const bool shouldThrowServerException = false;
    if (shouldThrowServerException) {
      throw const ServerException('Server failed to return sample payload.');
    }

    return const SampleModel(
      message: 'Sample feature loaded from clean architecture template.',
    );
  }
}
