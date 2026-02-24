/// Exceptions are thrown by data sources and translated into [Failure]s
/// at repository boundaries.
class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}

class CacheException implements Exception {
  const CacheException(this.message);

  final String message;
}
