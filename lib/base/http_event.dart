class HttpEvent<T> {
  final EventState state;
  final T data;

  HttpEvent({this.state, this.data});

  bool get isLoading => state == EventState.loading;
  bool get isSuccess => state == EventState.success;
}

enum EventState { loading, success, error }
