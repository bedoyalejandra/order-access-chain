import '../request.dart';
import 'Handler.dart';

class AuthHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.user == null) {
      print("Auth failed: user not authenticated.");
      return false;
    }
    print("Auth passed");
    return next?.handle(request) ?? true;
  }
}