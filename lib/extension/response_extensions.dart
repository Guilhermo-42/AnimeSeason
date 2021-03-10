import 'package:http/http.dart';

extension ResponseExtensions on Response {
    bool isFailure() {
      return this == null || this.statusCode != 200 || this.body == null;
    }

    bool isSuccess() {
      return !this.isFailure();
    }
}