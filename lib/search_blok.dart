import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc/search_event.dart';
import 'package:search_bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadedWork(word: word)) {
    on<SearchWork>(
      
      (event, emit) {

        List<String> searchedTiles = [];
        for (var elements in word) {
          if (elements.contains(event.word)) {
            searchedTiles.add(elements);
          }
        }
        emit(LoadedWork(
          word: searchedTiles
        ));
      },
    );
  }

  static List<String> word = [
    'Flutter',
    'React',
    'Java',
    'Kotlin',
    'Swifty',
  ];
}
