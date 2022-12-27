class User {
  String? sId;
  String? username;
  String? email;
  String? password;
  int? admin;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.username,
        this.email,
        this.password,
        this.admin,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    admin = json['admin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['admin'] = admin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}