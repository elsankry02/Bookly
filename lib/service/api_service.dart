import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getBook({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
