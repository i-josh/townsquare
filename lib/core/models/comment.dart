import 'like.dart';
import 'user.dart';

class Comment {
  String? sId;
  String? userId;
  String? postId;
  String? comment;
  String? reply;
  List<User>? replyUser;
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
      this.reply,
      this.replyUser,
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
    reply = json['reply'];
    if (json['replyUser'] != null) {
      replyUser = <User>[];
      json['replyUser'].forEach((v) {
        replyUser!.add(User.fromJson(v));
      });
    }
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
    data['reply'] = reply;
    if (replyUser != null) {
      data['replyUser'] = replyUser!.map((v) => v.toJson()).toList();
    }
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
