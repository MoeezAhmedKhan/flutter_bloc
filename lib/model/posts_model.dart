class PostsModel {
  int? postId;
  int? id;
  String? name;
  String? body;
  String? email;

  PostsModel({this.postId, this.id, this.name, this.body, this.email});

  PostsModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    body = json['body'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    data['email'] = email;
    return data;
  }
}
