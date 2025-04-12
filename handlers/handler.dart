import '../request.dart';

abstract class Handler {
  Handler? next;

  Handler setNext(Handler handler) {
    next = handler;
    return handler;
  }

  bool handle(Request request);
}

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