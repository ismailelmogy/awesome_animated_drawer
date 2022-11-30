abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers});

  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});

  Future<dynamic> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});
}
