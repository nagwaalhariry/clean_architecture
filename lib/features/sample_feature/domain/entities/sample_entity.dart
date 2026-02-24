import 'package:equatable/equatable.dart';

/// Domain entity: pure business object without framework concerns.
class SampleEntity extends Equatable {
  const SampleEntity({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
