import 'package:dio/dio.dart';

import '../../data/models/user_converter.dart';
import '../../domain/entities/user.dart';

class UserService {
  final Dio dio;
  final String baseUrl;
  final UserConverter userConverter;

  UserService(this.baseUrl, this.userConverter) : dio = Dio();

  Future<List<User>> fetchUsers() async {
    final response = await dio.get('$baseUrl/users');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => userConverter.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<User> createUser(User user) async {
    final response = await dio.post(
        '$baseUrl/users', data: userConverter.toJson(user));
    if (response.statusCode == 201) {
      return userConverter.fromJson(response.data);
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> updateUser(User user) async {
    final response = await dio.put(
        '$baseUrl/users/${user.id}', data: userConverter.toJson(user));
    if (response.statusCode == 200) {
      return userConverter.fromJson(response.data);
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await dio.delete('$baseUrl/users/$id');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}