abstract class SearchEvent{}
class SearchWork extends SearchEvent{
  final String word;

  SearchWork({required this.word});

}