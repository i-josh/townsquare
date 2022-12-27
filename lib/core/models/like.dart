class Like {
  String? sId;
  String? userId;
  String? postId;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Like(
      {this.sId,
        this.userId,
        this.postId,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Like.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    postId = json['postId'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['postId'] = postId;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}