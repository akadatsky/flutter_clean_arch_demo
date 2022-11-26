abstract class ListEvent {}

class ListInitEvent extends ListEvent {}

class UpdateListEvent extends ListEvent {
  final String request;

  UpdateListEvent(this.request);
}
