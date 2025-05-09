import '../../components/custom_book_details_app_bar.dart';
import '../../model/item_newset_model.dart';
import 'widget/similar_books_section.dart';
import '../book_action_page/books_details_sectioni.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/manger/smila_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final Items bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const CustomBookDetailsAppBar(),
                    BookDetailsSection(
                      book: widget.bookModel,
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    const SimilarBooksSection(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
