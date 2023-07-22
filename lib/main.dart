import 'package:flutter/material.dart';
import 'http/widgets/app/http_request.dart';
import 'json/json_serializable.dart';

void main() {
  const http = HttpRequest();
  const json = JsonSerializable();
  runApp(http);
}
