import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:part2_advanced/model/post_model.dart';

class ApiServices {
  Future<List<PostModel>> getPosts() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => PostModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final postProvider = Provider<ApiServices>((ref) => ApiServices());
