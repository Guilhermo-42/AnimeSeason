import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_heroes/base/http_event.dart';

class BaseBloc<T> {

  final StreamController _streamController = StreamController<HttpEvent<T>>();

  void dispose() => _streamController.close();

  Stream<HttpEvent<T>> get stream => _streamController.stream;

  @protected
  postLoading() {
    _streamController.sink.add(HttpEvent<T>(state: EventState.loading));
  }

  @protected
  postError() {
    _streamController.sink.add(HttpEvent<T>(state: EventState.error));
  }

  @protected
  postSuccess(T data) {
    _streamController.sink.add(HttpEvent<T>(data: data, state: EventState.success));
  }

}