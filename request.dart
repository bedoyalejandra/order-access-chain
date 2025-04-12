import 'user.dart';

class Request {
  final Map<String, dynamic> data;
  final String ip;
  final User? user;

  Request({required this.data, required this.ip, this.user});
}