import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_sample/api/api_response.dart';
import 'package:giphy_sample/bloc/bloc.dart';
import 'package:giphy_sample/bloc/events.dart';
import 'package:giphy_sample/bloc/states.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var items = <Data>[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListBloc, ListState>(
      // bloc: BlocProvider.of<ListBloc>(context),
      listener: (context, state) {
        if (state is ListLoadedState) {
          items = state.data;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Search text'),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: onSearch,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => Card(
                    child: CachedNetworkImage(
                      imageUrl: items[index].images?.previewGif?.url ?? '',
                      placeholder: (BuildContext context, String url) =>
                          const Placeholder(
                        fallbackWidth: 320,
                        fallbackHeight: 240,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onSearch(String request) {
    BlocProvider.of<ListBloc>(context).add(UpdateListEvent(request));
  }
}
