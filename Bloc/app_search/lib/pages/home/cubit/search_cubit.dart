import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_cubit/pages/home/cubit/search_state.dart';

import '../repository/MovieApi.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const NoTerm());
  final MovieApi _movieApi = MovieApi();

  void search(String term) async {
    if (term.isEmpty) {
      emit(const NoTerm());
    } else {
      emit(const Loading(''));
      try {
        final results = await _movieApi.searchMovies(term);
        emit(LoadSuccess(term, results));
      } on Exception {
        emit(LoadFailure(term));
      }
    }
  }
}
