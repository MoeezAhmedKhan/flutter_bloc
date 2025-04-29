import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/Utils/enums.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_bloc.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_event.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

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
      body: BlocBuilder<PostBloc, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text("Error: ${state.errorMesg}"));
            case PostStatus.success:
              return ListView.builder(itemCount: state.listOfPosts.length,itemBuilder: (context, index) {
                final item = state.listOfPosts[index];
                return ListTile(
                  title: Text(item.title.toString()),
                  subtitle: Text(item.body.toString()),
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(item.id.toString()),
                  ),
                );
              },);
          }
        },
      ),
    );
  }
}
