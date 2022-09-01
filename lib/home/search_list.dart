import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:part2_advanced/model/post_model.dart';

import '../view/post_detail.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key, required this.list}) : super(key: key);
  final List<PostModel> list;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  List<PostModel> _filteredList = [];

  void _handleFilter(query) {
    setState(() {
      _filteredList = widget.list
          .where(
              (post) => post.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    log("Count: " + _filteredList.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    _filteredList = List.from(widget.list);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          TextField(
              onChanged: (query) => _handleFilter(query),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "eg: Lorem ipsum",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white)),
          const SizedBox(height: 20.0),
          Expanded(
              child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetail(
                            e: _filteredList[index],
                          ),
                        ),
                      ),
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            _filteredList[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
