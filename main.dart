import 'handlers/admin_permission_handler.dart';
import 'handlers/auth_handler.dart';
import 'handlers/brute_force_protection_handler.dart';
import 'handlers/cache_handler.dart';
import 'handlers/data_sanitization_handler.dart';
import 'handlers/handler.dart';
import 'request.dart';
import 'user.dart';

void main() {
  Handler handler = AuthHandler();
  Handler authorizationHandler = AdminHandler();
  Handler dataSanitizationHandler = DataSanitizationHandler();
  Handler bruteForceHandler = BruteForceProtectionHandler();
  Handler cacheHandler = CacheHandler();

  // Establecer la cadena de responsabilidad
  handler
      .setNext(authorizationHandler)
      .setNext(dataSanitizationHandler)
      .setNext(bruteForceHandler)
      .setNext(cacheHandler);

  final request = Request(
    user: User(username: 'admin', password: '1234', isAdmin: true),
    ip: '192.168.1.1',
    data: {
      'orderId': 42,
      //'item': '<script>'
    },
  );

  final result = handler.handle(request);

  print(
    '\n${result ? "✔️ Request approved. Order placed" : "❌ Request denied."}',
  );
}
