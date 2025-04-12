import 'handlers/admin_permission_handler.dart';
import 'handlers/auth_handler.dart';
import 'handlers/brute_force_protection_handler.dart';
import 'handlers/cache_handler.dart';
import 'handlers/data_sanitization_handler.dart';
import 'request.dart';
import 'user.dart';

void main() {
  final handler = AuthHandler()
    ..setNext(AdminHandler())
    ..setNext(DataSanitizationHandler())
    ..setNext(BruteForceProtectionHandler())
    ..setNext(CacheHandler());

  final request = Request(
    user: User(username: 'admin', password: '1234', isAdmin: true),
    ip: '192.168.1.1',
    data: {'orderId': 42},
  );

  final result = handler.handle(request);

  print(
    '\n${result ? "✔️ Request approved. Order placed" : "❌ Request denied."}',
  );
}