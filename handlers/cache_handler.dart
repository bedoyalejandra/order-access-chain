import '../request.dart';
import 'handler.dart';

class CacheHandler extends Handler {
  final Map<String, String> cache = {};

  @override
  bool handle(Request request) {
    String key = request.data.toString();
    if (cache.containsKey(key)) {
      print("⚡️ Cached response returned.");
      return false;
    }
    print("🗃️ No cache, continue");
    return super.handle(request);
  }
}
