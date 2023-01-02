class Comment {
  String? sId;
  String? userId;
  String? postId;
  String? comment;
  String? reply;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Comment(
      {this.sId,
      this.userId,
      this.postId,
      this.comment,
      this.reply,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Comment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    postId = json['postId'];
    comment = json['comment'];
    reply = json['reply'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['postId'] = postId;
    data['comment'] = comment;
    data['reply'] = reply;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
