import 'package:get/get.dart';
import '../models/post.dart';
import '../models/comment.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var comments = <Comment>[].obs;
  var isLoading = true.obs;
  var isLoadingComments = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      var postList = await ApiService.getPosts();
      if (postList.isNotEmpty) {
        posts.assignAll(postList);
      } else {
        errorMessage('No posts found');
      }
    } catch (e) {
      errorMessage(e.toString().replaceAll('Exception: ', ''));
      Get.snackbar(
        'Error',
        e.toString().replaceAll('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  void fetchComments(int postId) async {
    try {
      isLoadingComments(true);
      var commentList = await ApiService.getComments(postId);
      comments.assignAll(commentList);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString().replaceAll('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingComments(false);
    }
  }

  void retryFetchPosts() {
    fetchPosts();
  }
}
