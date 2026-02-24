import '../../domain/entities/sample_entity.dart';

/// Data model responsible for serialization mapping.
class SampleModel extends SampleEntity {
  const SampleModel({required super.message});

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'message': message};
  }
}
