import 'package:flutter/material.dart';
import 'package:flutter_lessons/inherit/widgets/app/inherit_example.dart';
import 'http/widgets/app/http_request.dart';
import 'json/json_serializable.dart';

void main() {
  const http = HttpRequest();
  const json = JsonSerializable();
  const inherit = InheritExample();
  runApp(inherit);
}
