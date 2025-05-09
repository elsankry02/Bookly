import 'package:bookly/constant/string_manger.dart';
import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = StringManger.kBaseUrl;
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getBook({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
