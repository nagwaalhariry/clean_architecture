import 'package:equatable/equatable.dart';

import '../../../../src/core/error/failures.dart';
import '../../domain/entities/sample_entity.dart';

sealed class SampleFeatureState extends Equatable {
  const SampleFeatureState();

  @override
  List<Object?> get props => [];
}

class SampleFeatureInitial extends SampleFeatureState {
  const SampleFeatureInitial();
}

class SampleFeatureLoading extends SampleFeatureState {
  const SampleFeatureLoading();
}

class SampleFeatureLoaded extends SampleFeatureState {
  const SampleFeatureLoaded(this.entity);

  final SampleEntity entity;

  @override
  List<Object?> get props => [entity];
}

class SampleFeatureError extends SampleFeatureState {
  const SampleFeatureError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
