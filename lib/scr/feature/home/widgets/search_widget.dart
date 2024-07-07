import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_bloc.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_event.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: 'Enter name',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () => bloc.add(SearchHomeEvent(searchString: _textController.text)),
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
