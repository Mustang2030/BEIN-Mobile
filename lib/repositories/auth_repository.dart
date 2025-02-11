import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepository(this._dio);

  //Register a new user
  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> registrationData) async {
    try {
      final response = await _dio.post(
          "${_dio.options.baseUrl}/Account/Register",
          data: registrationData);
      return response.data;
    } catch (e) {
      throw Exception("Failed to register: ${e.toString()}");
    }
  }

  //Sign in a user and store the token
  Future<Map<String, dynamic>> signInUser(
      Map<String, dynamic> signInData) async {
    try {
      final response = await _dio.post("${_dio.options.baseUrl}/Account/SignIn",
          data: signInData);

      if (response.statusCode != 200) {
        throw Exception("Failed to sign in: ${response.statusMessage}");
      }

      //Extracting the auth token from Set-Cookie header
      String? authToken;
      var headers = response.headers.map;
      if (headers.containsKey("set-cookie")) {
        var cookies = headers["set-cookie"]!.join("; ");
        RegExp regExp = RegExp(r"AuthToken=([^;]+)");
        var match = regExp.firstMatch(cookies);
        if (match != null) {
          authToken = match.group(1);
        }
      }

      if (authToken == null) {
        throw Exception("Auth token not found in response headers");
      }

      //Store the token securely
      await _storage.write(key: "authToken", value: authToken);

      //Set Authorization header for future requests
      _dio.options.headers["Authorization"] = "Bearer $authToken";

      return response.data;
    } catch (e) {
      throw Exception("Failed to Sign-In: ${e.toString()}");
    }
  }

  //Sign out a user and remove the token
  Future<Map<String, dynamic>> signOut() async {
    try {
      final response = await _dio.post("/Account/SignOut");

      if (response.statusCode == 200) {
        await _storage.delete(key: "authToken");
        _dio.options.headers.remove("Authorization");
      }

      return response.data;
    } catch (e) {
      throw Exception("Not signed out properly: ${e.toString()}");
    }
  }

  //Load the stored token on app startup
  Future<void> loadAuthToken() async {
    String? token = await _storage.read(key: "authToken");
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
  }
}
