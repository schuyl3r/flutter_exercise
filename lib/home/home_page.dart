import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:part2_advanced/home/search_list.dart';

import '../dataprovider/data_provider.dart';
import '../model/post_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _data = ref.watch(postDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: _data.when(
          data: (_data) {
            List<PostModel> postList = _data.map((e) => e).toList();
            return SearchList(list: postList);
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
