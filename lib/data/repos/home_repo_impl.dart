import '../../errors/failures.dart';
import '../../model/item_newset_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../service/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<Items>>> fetchNewestBooks() async {
    try {
      final data = await apiService.getBook(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:computer');
      List<Items> books = [];
      for (var item in data['items']) {
        books.add(Items.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(
        ServerFailuer(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failuer, List<Items>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.getBook(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<Items> books = [];
      for (var item in data['items']) {
        books.add(Items.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(
        ServerFailuer(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failuer, List<Items>>> fetchSimilerBooks(
      {required String category}) async {
    try {
      final data = await apiService.getBook(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
      List<Items> books = [];
      for (var item in data['items']) {
        books.add(Items.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(
        ServerFailuer(e.toString()),
      );
    }
  }

  // @override
  // Future<Either<Failuer, List<Items>>> fetchSearch() async {
  //   try {
  //     final data = await apiService.getBook(
  //         endPoint: 'volumes?Filtering=free-ebooks&q=subject:computer');
  //     List<Items> books = [];
  //     for (var oneItem in data['items']) {
  //       books.add(Items.fromJson(oneItem as Map<String, dynamic>));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailuer.fromDioException(e));
  //     }
  //     return left(
  //       ServerFailuer(e.toString()),
  //     );
  //   }
  // }
}
