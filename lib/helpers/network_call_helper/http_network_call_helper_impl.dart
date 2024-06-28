import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pet_care_task/helpers/network_call_helper/network_call_helper.dart';

@LazySingleton(as: NetworkCallHelper)
class HttpNetworkCallHelperImpl implements NetworkCallHelper {
  final Logger logger;

  HttpNetworkCallHelperImpl({required this.logger});

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers}) async {
    if (params != null) {
      final query = params.entries
          .where((element) => element.value != null)
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      url = '$url?$query';
    }
    final response = await http.get(Uri.parse(url),
        headers: {'Content-Type': 'application/json', ...?headers});

    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    try {
      logger.i(body);
      final response = await http.post(Uri.parse(url),
          body: json.encode(body),
          headers: {'Content-Type': 'application/json', ...?headers});
      logger.i(response.body);
      return json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      logger.e("Error $e");
      rethrow;
    }
  }
}
