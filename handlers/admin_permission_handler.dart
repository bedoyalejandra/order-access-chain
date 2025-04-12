import '../request.dart';
import 'handler.dart';

class AdminHandler extends Handler {
  @override
  bool handle(Request request) {
    if (request.user == null || !request.user!.isAdmin) {
      print('⛔ Permission denied: not admin.');
      return false;
    }
    print('👑 Permission granted');
    return next?.handle(request) ?? true;
  }
}
