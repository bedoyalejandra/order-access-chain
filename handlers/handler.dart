import '../request.dart';

abstract class Handler {
  Handler? next;

  Handler setNext(Handler handler) {
    next = handler;
    return handler;
  }

  bool handle(Request request);
}
