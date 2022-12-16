import 'package:data/data.dart';

abstract class ListState {}

class ListInitState extends ListState {}

class ListLoadedState implements ListState {
  final List<Gif> data;

  ListLoadedState(this.data);
}
