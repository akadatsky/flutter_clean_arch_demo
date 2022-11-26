import 'package:giphy_sample/api/api_response.dart';

abstract class ListState {}

class ListInitState extends ListState {}

class ListLoadedState implements ListState {
  final List<Data> data;

  ListLoadedState(this.data);
}
