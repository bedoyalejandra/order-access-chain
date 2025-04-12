class Request {
  final Map<String, dynamic> data;
  final String ip;
  final String? user;

  Request({required this.data, required this.ip, this.user});
}