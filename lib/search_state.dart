abstract class SearchState{}
class InitState extends SearchState{}
class Loading extends SearchState{}
class LoadedWork extends SearchState{
  final List<String>word;


  LoadedWork({required this.word});}
