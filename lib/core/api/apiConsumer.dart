abstract class ApiConsumer {
  Future<dynamic> get(
    String url, {
    Object? data,
    
    Map<String, dynamic>? queryParameter,
    
  });
  Future<dynamic> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  });
  Future<dynamic> delete(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  });
}
