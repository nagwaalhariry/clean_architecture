import 'package:get_it/get_it.dart';

import '../../features/sample_feature/data/datasources/sample_remote_data_source.dart';
import '../../features/sample_feature/data/repositories/sample_repository_impl.dart';
import '../../features/sample_feature/domain/repositories/sample_repository.dart';
import '../../features/sample_feature/domain/usecases/get_sample_message.dart';
import '../../features/sample_feature/presentation/cubit/sample_feature_cubit.dart';
import '../core/network/network_info.dart';
import '../core/network/network_info_impl.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Presentation
  sl.registerFactory<SampleFeatureCubit>(
    () => SampleFeatureCubit(getSampleMessage: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GetSampleMessage>(
    () => GetSampleMessage(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<SampleRepository>(
    () => SampleRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SampleRemoteDataSource>(
    SampleRemoteDataSourceImpl.new,
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
}
