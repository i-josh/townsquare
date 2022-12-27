import 'user.dart';
import 'like.dart';

class Post {
  String? sId;
  String? title;
  String? body;
  String? category;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? views;
  List<User>? user;
  List<Like>? likes;

  Post(
      {this.sId,
      this.title,
      this.body,
      this.category,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.views,
      this.user,
      this.likes});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    category = json['category'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    views = json['views'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Like>[];
      json['likes'].forEach((v) {
        likes!.add(Like.fromJson(v));
      });
    }
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
    data['__v'] = iV;
    data['views'] = views;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
