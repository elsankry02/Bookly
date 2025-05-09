import '../../errors/failures.dart';
import '../../model/item_newset_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<Items>>> fetchNewestBooks();
  Future<Either<Failuer, List<Items>>> fetchFeaturedBooks();
  Future<Either<Failuer, List<Items>>> fetchSimilerBooks(
      {required String category});
}
