import '../../model/item_newset_model.dart';
import 'package:flutter/material.dart';

import '../../components/custom_book_image.dart';
import '../../components/custom_book_rating.dart';
import '../../constant/styles_manger.dart';
import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final Items book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.volumeInfo!.title!,
          style: StylesManger.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo!.authors?[0] ?? '',
            style: StylesManger.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        CustomBookRating(
          rating: book.volumeInfo!.averageRating ?? 0,
          count: book.volumeInfo!.ratingsCount?.round() ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
