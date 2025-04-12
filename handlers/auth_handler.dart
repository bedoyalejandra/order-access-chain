import '../request.dart';
import 'Handler.dart';

class AuthHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.user == null || request.user!.password != '1234') {
      print("❌ Auth failed");
      return false;
    }
    print("✅ Auth passed");
    return next?.handle(request) ?? true;
  }
}
