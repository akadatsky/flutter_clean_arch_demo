import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_sample/bloc/events.dart';
import 'package:giphy_sample/bloc/states.dart';
import 'package:data/data.dart';

class ListBloc extends Bloc<ListEvent, ListState> {

  final IGifRepository gifRepository;

  ListBloc(this.gifRepository) : super(ListInitState()) {
    on<UpdateListEvent>(onListEvent);
  }

  Future<void> onListEvent(
    UpdateListEvent event,
    Emitter<ListState> emit,
  ) async {
    final result = await gifRepository.getGifs(event.request);
    emit(ListLoadedState(result));
  }
}
