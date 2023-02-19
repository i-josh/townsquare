import 'package:townsquare/core/models/user.dart';

import 'like.dart';

class Post {
  String? sId;
  String? title;
  String? body;
  String? category;
  String? createdBy;
  String? createdAt;
  String? image;
  String? updatedAt;
  int? views;
  int? iV;
  bool? sponsored;
  User? user;
  List<Like>? likes;
  int? comments;

  Post(
      {this.sId,
      this.title,
      this.body,
      this.category,
      this.createdBy,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.views,
      this.iV,
      this.sponsored,
      this.user,
      this.likes,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    category = json['category'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    image = json['image'];
    views = json['views'];
    iV = json['__v'];
    sponsored = json['sponsored'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['likes'] != null) {
      likes = <Like>[];
      json['likes'].forEach((v) {
        likes!.add(Like.fromJson(v));
      });
    }
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['body'] = body;
    data['category'] = category;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['views'] = views;
    data['image'] = image;
    data['__v'] = iV;
    data['sponsored'] = sponsored;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    data['comments'] = comments;
    return data;
  }
}
