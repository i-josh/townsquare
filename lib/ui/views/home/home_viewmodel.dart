import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';
import 'package:townsquare/core/utils/local_store_dir.dart';
import 'package:townsquare/core/utils/local_stotage.dart';
import 'package:townsquare/globals.dart';

import '../../../core/di/service_locator.dart';

class HomeViewModel extends BaseViewModel {
  final _repo = locator<HomeRepository>();
  final snackBar = locator<SnackbarService>();

  List<Post>? posts;
  List<Comment>? comments;
  final log = getLogger("HomeViewModel");

  void disposeData() {
    comments = null;
    notifyListeners();
  }

  void initialize() async {
    // await locator<LocalStorage>().delete(key: LocalStorageDir.authToken);
    log.i("called");
    checkToken();
    getPosts();
  }

  void checkToken() async {
    String? authToken = await locator<LocalStorage>().fetch(
      key: LocalStorageDir.authToken,
      type: StorageType.string,
    );

    tokenValueNotifier.value = authToken;
  }

  void getPosts() async {
    try {
      ApiResponse apiResponse = await _repo.getPosts();
      if (apiResponse.statusCode == 200) {
        List<Post> newData = [];
        List<dynamic> responseData = apiResponse.data["data"];
        for (var element in responseData) {
          newData.add(Post.fromJson(Map<String, dynamic>.from(element)));
        }
        posts = newData;
        notifyListeners();
      } else {
        log.e(apiResponse.data);
        snackBar.showSnackbar(message: apiResponse.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }
  }

  void getPostComments(Post post) async {
    try {
      ApiResponse apiResponse = await _repo.getComments(post.sId!);
      if (apiResponse.statusCode == 200) {
        List<Comment> newData = [];
        List<dynamic> responseData = apiResponse.data["comments"];
        for (var element in responseData) {
          newData.add(Comment.fromJson(Map<String, dynamic>.from(element)));
        }
        comments = newData;
        notifyListeners();
      } else {
        log.e(apiResponse.data);
        snackBar.showSnackbar(message: apiResponse.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }
  }

  void incrementViews(Post post) async {
    try {
      await _repo.incrementViews(post.sId!);
    } catch (e) {
      log.e(e);
    }
  }
}
