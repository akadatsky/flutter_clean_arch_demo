import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_sample/bloc/events.dart';
import 'package:giphy_sample/bloc/states.dart';
import 'package:giphy_sample/data/data_source.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitState()) {
    on<UpdateListEvent>(onListEvent);
  }

  Future<void> onListEvent(
    UpdateListEvent event,
    Emitter<ListState> emit,
  ) async {
    final result = await DataSource().getData(event.request);
    emit(ListLoadedState(result));
  }
}
