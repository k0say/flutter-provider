import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<Post> posts = [];
    for (var item in data) {
      var singlePost = Post.fromJson(item);
      posts.add(singlePost);
    }
    return posts;
  } else {
    throw Exception('Failed to load data');
  }
}

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
