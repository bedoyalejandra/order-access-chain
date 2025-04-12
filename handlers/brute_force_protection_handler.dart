import '../request.dart';
import 'handler.dart';

class BruteForceProtectionHandler extends Handler {
  final Map<String, int> failedAttempts = {};

  @override
  bool handle(Request request) {
    int attempts = failedAttempts[request.ip] ?? 0;
    if (attempts >= 5) {
      print("Blocked: too many failed attempts.");
      return false;
    }
    print("Brute force protection passed");
    return next?.handle(request) ?? true;
  }
}