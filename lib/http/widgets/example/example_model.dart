import 'package:flutter/material.dart';

import '../../domains/api_clients/api_client.dart';
import '../../domains/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = const <Post>[];

  List<Post> get posts => _posts;

  void reloadPosts() async {
    _posts += await apiClient.getPosts();
    notifyListeners();
  }

  void createPost() async {
    final result = await apiClient.createPost(
      title: 'test test1',
      body: 'hdg fagsdjhfg jadgsfhjg',
    );
    print(result);
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(ExampleModelProvider oldWidget) {
    return true;
  }
}
