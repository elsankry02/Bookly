import '../../../model/item_newset_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
