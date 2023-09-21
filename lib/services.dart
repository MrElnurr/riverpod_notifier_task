import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';

class PostsNotifier extends StateNotifier<List<Posts>> {
  PostsNotifier() : super([]);

  Future<List<Posts>?> getPosts() async {
    var res = await Dio().get("https://jsonplaceholder.typicode.com/posts");

    try {
      if (res.statusCode == 200) {
        var data = res.data;
        if (data is List) {
          state = data.map((e) => Posts.fromJson(e)).toList();
          return [...state];
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return [];
  }

  deletePost(int id) {
    state = [
      for (final post in state)
        if (id != post.id) post,
    ];
    return [...state];
  }

  reversePost() {
    state = state.reversed.toList();
    return [...state];
  }

  addPost(String body, int id, String title, int userId) {
    final posts = <Posts>[
      ...state,
      Posts(body: body, id: id, title: title, userId: userId)
    ];
    state = posts;
    return [...state];
  }
}
