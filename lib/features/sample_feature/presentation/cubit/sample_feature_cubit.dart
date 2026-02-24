import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/core/usecase/base_usecase.dart';
import '../../domain/usecases/get_sample_message.dart';
import 'sample_feature_state.dart';

class SampleFeatureCubit extends Cubit<SampleFeatureState> {
  SampleFeatureCubit({required this.getSampleMessage})
      : super(const SampleFeatureInitial());

  final GetSampleMessage getSampleMessage;

  Future<void> load() async {
    emit(const SampleFeatureLoading());
    final result = await getSampleMessage(const NoParams());

    result.fold(
      (failure) => emit(SampleFeatureError(failure)),
      (entity) => emit(SampleFeatureLoaded(entity)),
    );
  }
}
