import 'dart:convert';
import 'package:piapp/model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "https://ddd9-103-165-167-2.ngrok-free.app/api/Users";

  // Get User Data
  Future<List<Users>> getUserData() async {
    List<Users> data = [];
    final uri = Uri.parse(baseUri);

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        if (response.body.isNotEmpty) {
          final List<dynamic> jsonData = json.decode(response.body);
          data = jsonData.map((json) => Users.fromJson(json)).toList();
        }
      } else {
        throw Exception('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return data;
  }

  // Add User
  Future<http.Response> addUser({required Users user}) async {
    final uri = Uri.parse(baseUri);

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 201) {
        // User successfully registered
        print('User registered successfully');
      } else if (response.statusCode == 409) {
        // User already exists
        print('User already registered');
      } else {
        // Other errors
        print('Failed to register user: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      print('Error adding user: $e');
      throw Exception('Failed to add user');
    }
  }

  // Add User Phone
  Future<http.Response> addUserPhone({required UserPhone userPhone}) async {
    final uri = Uri.parse('$baseUri/userphone');

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(userPhone.toJson()),
      );

      // Handle specific HTTP status codes
      if (response.statusCode == 409) {
        // If phone number is already registered
        print('User with this phone number is already registered.');
      } else if (response.statusCode == 201) {
        // Successfully registered the user
        print('User registered successfully');
      }

      return response;
    } catch (e) {
      print('Error adding user phone: $e');
      throw Exception('Failed to add user phone');
    }
  }

  // Login
  Future<http.Response> login(
      {required String email, required String password}) async {
    final uri = Uri.parse("$baseUri/login");

    try {
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception('User not found, please sign up');
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error logging in: $e'); // Logs the original exception message
      rethrow; // Re-throws the original exception
    }
  }

  // Login User Phone
  Future<http.Response> loginUserPhone(
      {required String phone, required String password}) async {
    final uri = Uri.parse("$baseUri/userphone/login");

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': phone,
          'password': password,
        }),
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception('User not found, please sign up');
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error logging in user phone: $e');
      throw Exception('Failed to login user phone');
    }
  }
}
