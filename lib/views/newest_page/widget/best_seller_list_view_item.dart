import 'package:bookly/constant/string_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/custom_book_image.dart';
import '../../../components/custom_book_rating.dart';
import '../../../constant/styles_manger.dart';
import '../../../model/item_newset_model.dart';
import '../../../router/app_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final Items bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: StylesManger.textStyle20.copyWith(
                        fontFamily: StringManger.kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo!.authors![0],
                    style: StylesManger.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: StylesManger.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      CustomBookRating(
                        rating: bookModel.volumeInfo!.averageRating ?? 0,
                        count: bookModel.volumeInfo!.ratingsCount?.round() ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
