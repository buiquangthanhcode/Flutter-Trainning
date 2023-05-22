import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  const SearchState(this.searchTerm, this.searchResults);
  final String searchTerm;
  final List<dynamic> searchResults;

  @override
  List<Object> get props => [searchTerm, searchResults];
}

class Loading extends SearchState {
  const Loading(String searchTerm) : super(searchTerm, const []);
}
class LoadSuccess extends SearchState {
  const LoadSuccess(String searchTerm, List<dynamic> searchResults)
      : super(searchTerm, searchResults);
}
class LoadFailure extends SearchState {
  const LoadFailure(String searchTerm) : super(searchTerm, const []);
}
class NoTerm extends SearchState {
  const NoTerm() : super('', const []);
}
