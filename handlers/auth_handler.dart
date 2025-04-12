import '../request.dart';
import 'handler.dart';

class AuthHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.user == null || request.user!.password != '1234') {
      print("❌ Auth failed");
      return false;
    }
    print("✅ Auth passed");
    return super.handle(request);
  }
}
