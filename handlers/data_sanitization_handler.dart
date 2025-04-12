import '../request.dart';
import 'handler.dart';

class DataSanitizationHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.data.values.any((v) => v.toString().contains('<script>'))) {
      print("🚨 Malicious input detected.");
      return false;
    }

    request.data.updateAll((key, value) {
      if (value is String) {
        return value.replaceAll(RegExp(r'[^\w\s@.-]'), '');
      }
      return value;
    });
    
    print("🧼 Data sanitized");
    return super.handle(request);
  }
}
