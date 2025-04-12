import '../request.dart';
import 'handler.dart';

class AdminPermissionHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.user != 'admin') {
      print("Permission denied: not admin.");
      return false;
    }
    print("Permission granted");
    return next?.handle(request) ?? true;
  }
}