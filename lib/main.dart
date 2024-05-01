import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc/search_blok.dart';
import 'package:search_bloc/search_event.dart';
import 'package:search_bloc/search_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchWordPage(),
      ),
    );
  }
}

class SearchWordPage extends StatelessWidget {
  const SearchWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SEARCH PROGECT',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 121, 5, 142),
      ),
      body: Column(
        children: [
          _searchField(context),
          Expanded(child: _word(context)),
        ],
      ),
    );
  }
}

Widget _searchField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search ...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          )),
      onChanged: (value) {
        context.read<SearchBloc>().add(SearchWork(word:value));
      },
    ),
  );
}

Widget _word(BuildContext context) {
  return BlocBuilder<SearchBloc, SearchState>(
    builder: (context, state) {
      if (state is LoadedWork)
        return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.word[index],
                  style: TextStyle(
                    color: const Color.fromARGB(255, 14, 14, 14),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 0.2,
              );
            },
            itemCount: state.word.length);
      return Container();
    },
  );
}
