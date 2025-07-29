import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/post_controller.dart';
import 'views/posts_list_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: PostsListPage(),
    );
  }
}
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
  }
}