import '../request.dart';
import 'handler.dart';

class DataSanitizationHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.data.values.any((v) => v.toString().contains('<script>'))) {
      print("Malicious input detected.");
      return false;
    }
    print("Data sanitized");
    return next?.handle(request) ?? true;
  }
}