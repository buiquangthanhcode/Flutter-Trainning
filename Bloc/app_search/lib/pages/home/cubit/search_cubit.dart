import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timer_cubit/pages/home/cubit/search_state.dart';

import '../repository/MovieApi.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const NoTerm());
  final MovieApi _movieApi = MovieApi();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  String term = "";
  void setTerm(String term) {
    this.term = term;
  }

  void search() async {
    if (term.isEmpty) {
      emit(const NoTerm());
    } else {
      emit(const Loading(''));
      try {
        final results = await _movieApi.searchMovies(term, page);

        emit(LoadSuccess(term, results));
      } on Exception {
        emit(LoadFailure(term));
      }
    }
  }

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("Refesh");
    print("Current page" + page.toString());
    if (page <= 1) {
      page = 1;
    } else {
      page = page - 1;
    }
    search();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("Loading");
    print("Current page" + page.toString());
    page = page + 1;
    search();
    refreshController.loadComplete();
  }
}
