import 'dart:developer';
import 'package:dio/dio.dart';

// first install ngrok using choco install ngrok for windows
// and brew install ngrok for macOS
// then start ngrok on a local server using ngrok http (name of endpoint e.g https://localhost:7012)

class DioApiService {
  final Dio dio;
  final String baseUrl;

  DioApiService(
      {this.baseUrl =
      "https://0a2b-197-185-213-12.ngrok-free.app/api.bein.com/"})
      : dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'jwdToken',
      })) {
    _initializeInterceptors();
  }

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      log('DioException: ${e.response?.data}');
      throw Exception(e.response?.data);
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<Response> putRequest(String endpoint, dynamic data) async {
    try {
      log("Updating data on $endpoint...");

      // Log the type of data being posted
      log("Data type: ${data.runtimeType}");

      Response response;

      if (data is FormData) {
        log("Updating multipart form-data...");
        response = await dio.put(endpoint, data: data);
      } else {
        log("Updating regular form-data...");
        response = await dio.put(endpoint, data: data);
      }

      // Log the entire response for debugging purposes
      log('Response received: ${response.data}');

      return response; // Return the full Response object, not just response.data
    } on DioException catch (e) {
      log("${e.response?.data}");
      throw Exception("${e.response?.data}");
    }
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    try {
      log("Posting data to $endpoint...");

      // Log the type of data being posted
      log("Data type: ${data.runtimeType}");

      Response response;

      // Check if data is already FormData, otherwise send it as JSON
      if (data is FormData) {
        log("Sending multipart form-data...");
        response = await dio.post(endpoint, data: data);
      } else {
        log("Sending regular form-data...");
        response = await dio.post(endpoint, data: data);
        response.data = data;
        log("Response received: ${response.toString()}");
        log("Data: ${data.toString()}");
      }

      log("Response received: ${response.data}");
      return response; // Return the full response object
    } on DioException catch (e) {
      log("${e.response}");
      throw Exception("${e.response?.statusMessage} ");
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      log("Deleting data at $endpoint...");

      Response response = await dio.delete(endpoint);

      // Log the entire response for debugging purposes
      log('Response received: ${response.data}');

      return response; // Return the full Response object, not just response.data
    } on DioException catch (e) {
      log("${e.response?.data}");
      throw Exception("${e.response?.data}");
    }
  }

  Future<Response> downloadRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await dio.download(endpoint, data);
      return response;
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }

  void _initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log request data for debugging
          log("Request to ${options.uri}");
          log("Headers: ${options.headers}");
          log("Data: ${options.data}"); // Logs sensitive data; handle carefully
          handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response data
          log("Response from ${response.requestOptions.uri}");
          log("Status code: ${response.statusCode}");
          log("Response data: ${response.data}"); // Logs sensitive data; handle carefully
          handler.next(response);
        },
        onError: (DioException error, handler) {
          // Log errors
          log("Error: ${error.message}");
          if (error.response != null) {
            log("Error status code: ${error.response?.statusCode}");
            log("Error response data: ${error.response?.data}");
          }
          handler.next(error);
        },
      ),
    );
  }
}
