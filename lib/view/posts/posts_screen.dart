import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/Utils/enums.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_bloc.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_event.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart';

class PostsScreen extends StatefulWidget {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      context.read<PostBloc>().add(FetchPostsEvent());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calling Get API"),
      ),
      body: GestureDetector(
          onTap: () {
            widget.searchFocusNode.unfocus();
          },
          child: BlocBuilder<PostBloc, PostsState>(
            builder: (context, state) {
              switch (state.status) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Center(child: Text("Error: ${state.errorMesg}"));
                case PostStatus.success:
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: BlocBuilder<PostBloc, PostsState>(
                          builder: (context, state) {
                            return TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search Here...",
                              ),
                              controller: widget.searchController,
                              focusNode: widget.searchFocusNode,
                              onChanged: (value) {
                                log("value is: $value");
                                context.read<PostBloc>().add(SearchPostEvent(searchText: value));
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: state.searchMesg.isNotEmpty ? Center(child: Text(state.searchMesg.toString())) : ListView.builder(
                          itemCount: state.tempListOfPosts.isEmpty ? state.listOfPosts.length : state.tempListOfPosts.length, itemBuilder: (context, index) {
                          final item = state.tempListOfPosts.isEmpty ? state.listOfPosts[index] : state.tempListOfPosts[index];
                          if (state.listOfPosts.isEmpty) {
                            return const Center(child: Text("No Data Found"));
                          }
                          return ListTile(
                            title: Text(item.name.toString()),
                            subtitle: Text("${item.email}\n${item.body}"),
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Text(item.id.toString()),
                            ),
                          );
                        },),
                      ),
                    ],
                  );
              }
            },
          )),
    );
  }
}
