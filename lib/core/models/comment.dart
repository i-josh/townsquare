import 'package:townsquare/core/models/user.dart';

import 'like.dart';

class Comment {
  String? sId;
  String? userId;
  String? postId;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Like>? likes;
  List<User>? user;

  Comment(
      {this.sId,
      this.userId,
      this.postId,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.likes,
      this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    postId = json['postId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['likes'] != null) {
      likes = <Like>[];
      json['likes'].forEach((v) {
        likes!.add(Like.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['postId'] = postId;
    data['comment'] = comment;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
