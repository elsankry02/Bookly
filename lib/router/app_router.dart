import '../model/item_newset_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/service_locator.dart';
import '../data/manger/smila_books_cubit/similar_books_cubit.dart';
import '../data/repos/home_repo_impl.dart';
import '../views/Splash/splash_view.dart';
import '../views/book_details_page/book_details_view.dart';
import '../views/newest_page/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as Items,
          ),
        ),
      ),
    ],
  );
}
