import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/post_model.dart';
import '../services/service.dart';

final postDataProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.watch(postProvider).getPosts();
});
