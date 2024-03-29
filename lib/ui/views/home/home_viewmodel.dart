import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/core/models/like.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/core/models/user.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';
import 'package:townsquare/core/utils/local_store_dir.dart';
import 'package:townsquare/core/utils/local_stotage.dart';
import 'package:townsquare/globals.dart';

import '../../../core/di/service_locator.dart';

class HomeViewModel extends BaseViewModel {
  final _repo = locator<HomeRepository>();
  final snackBar = locator<SnackbarService>();
  bool showReplying = false;
  bool isReplyingToPost = false;
  final commentController = TextEditingController();
  final replyCommentController = TextEditingController();

  // bool commentIsReplying = false;
  String replyingTo = "";
  bool commentReplyingLoading = false;

  List<Post>? posts;
  List<Post>? sponsoredPosts;
  List<Comment>? comments;
  final log = getLogger("HomeViewModel");

  void disposeData() {
    comments = null;
    notifyListeners();
  }

  void initialize() async {
    // await locator<LocalStorage>().delete(key: LocalStorageDir.authToken);
    checkToken();
    getPosts();
    getSponsoredPosts();
  }

  void checkToken() async {
    String? authToken = await locator<LocalStorage>().fetch(
      key: LocalStorageDir.authToken,
      type: StorageType.string,
    );

    String? authUser = await locator<LocalStorage>().fetch(
      key: LocalStorageDir.authUser,
      type: StorageType.string,
    );

    User user = User.fromJson(jsonDecode(authUser!));

    tokenValueNotifier.value = authToken;
    userValueNotifier.value = user;
  }

  void toggleShowReplying() {
    showReplying = !showReplying;
    notifyListeners();
  }

  void toggleShowCommentReplying(Comment comment) {
    // commentIsReplying = !commentIsReplying;
    replyingTo = comment.sId!;
    notifyListeners();
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

  void getSponsoredPosts() async {
    try {
      ApiResponse apiResponse =
          await _repo.getPosts(queryParams: {"sponsored": "true"});
      if (apiResponse.statusCode == 200) {
        List<Post> newData = [];
        List<dynamic> responseData = apiResponse.data["data"];
        for (var element in responseData) {
          newData.add(Post.fromJson(Map<String, dynamic>.from(element)));
        }
        sponsoredPosts = newData;
        notifyListeners();
      } else {
        log.e(apiResponse.data);
        snackBar.showSnackbar(message: apiResponse.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }
  }

  void addReply(Comment comment) async {
    log.i("something de happen o ${replyCommentController.text}");
    log.i(comments?.length);
    if (replyCommentController.text.isEmpty) {
      return;
    }
    if (!commentReplyingLoading) {
      commentReplyingLoading = true;
      notifyListeners();

      try {
        ApiResponse apiResponse = await _repo.addComment({
          "postId": comment.postId,
          "comment": replyCommentController.text,
          "reply": comment.comment,
          "replyUser": comment.userId
        });

        if (apiResponse.statusCode == 201) {
          replyCommentController.text = "";
          getPostComments(comment.postId!);
        }
      } catch (e) {
        log.e(e);
      }

      replyingTo = "";
      commentReplyingLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPostComments(String postId) async {
    try {
      ApiResponse apiResponse = await _repo.getComments(postId);
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

  void addComment(Post post) async {
    if (commentController.text.isEmpty) {
      return;
    }
    isReplyingToPost = true;
    notifyListeners();
    try {
      ApiResponse apiResponse = await _repo.addComment({
        "postId": post.sId,
        "comment": commentController.text,
      });

      if (apiResponse.statusCode == 201) {
        await getPostComments(post.sId!);
      } else {
        log.e(apiResponse.data);
        snackBar.showSnackbar(message: apiResponse.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }
    isReplyingToPost = false;
    commentController.text = "";
    notifyListeners();
  }

  bool hasLikedPost(post) {
    String? userId = userValueNotifier.value?.sId;

    List<Like> likes =
        post.likes!.where((element) => element.userId == userId).toList();
    if (likes.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
