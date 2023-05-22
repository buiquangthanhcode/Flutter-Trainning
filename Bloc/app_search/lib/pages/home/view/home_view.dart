import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:timer_cubit/pages/home/cubit/search_cubit.dart';
import 'package:timer_cubit/pages/home/cubit/search_state.dart';

import 'widget/card_movie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        String query = _searchController.text;
                        // Xử lý tìm kiếm với query ở đây
                        print('Searching for: $query');
                        context.read<SearchCubit>().search(query);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                    child: state is Loading
                        ? Center(child: CircularProgressIndicator())
                        : state is LoadFailure
                            ? Center(child: Text('Error'))
                            : state is NoTerm
                                ? Center(child: Text('Enter a term to begin'))
                                : state is LoadSuccess
                                    ? ListView.builder(
                                        itemCount: state.searchResults.length,
                                        itemBuilder: (context, index) {
                                          return MovieCard(
                                              movie:
                                                  state.searchResults[index]);
                                        },
                                      )
                                    : Center(child: Text('Error'))),
              ],
            ),
          );
        },
      ),
    );
  }
}
