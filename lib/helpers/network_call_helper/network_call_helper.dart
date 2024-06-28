abstract class NetworkCallHelper {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  });
}
