import 'dart:convert';

import 'package:learn_flutter_bloc/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo{
  Future<List<PostsModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) => PostsModel(name: e["name"], body: e['body'], id: e["id"], postId: e["postId"], email: e["email"])).toList();
      } else {
        throw Exception("Failed to fetch posts");
      }
    } catch (e) {
      throw Exception("Error fetching posts");
    }
  }
}