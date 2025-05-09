import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_book_image.dart';
import '../../../components/custom_error_widget.dart';
import '../../../components/custom_loading_indicator.dart';
import '../../../data/manger/smila_books_cubit/similar_books_cubit.dart';

class SimilarBooksWidget extends StatelessWidget {
  const SimilarBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo!.imageLinks?.thumbnail ??
                          'error',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
