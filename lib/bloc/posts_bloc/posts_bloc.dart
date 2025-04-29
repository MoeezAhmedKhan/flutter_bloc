//
//
// import 'package:bloc/bloc.dart';
// import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_event.dart';
// import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart';
//
// import '../../Utils/enums.dart';
// import '../../repository/posts_repo.dart';
//
// class PostsBloc extends Bloc<PostsEvent, PostsState> {
//
//   PostsRepo _postRepo = PostsRepo();
//   PostsBloc() : super(PostsState()) {
//     on<FetchPostsEvent>(_fetchPosts);
//   }
//   void _fetchPosts(FetchPostsEvent event, Emitter<PostsState> emit){
//     _postRepo.fetchPosts().then((value) {
//         emit(state.copyWith(listOfPosts: value, status: PostStatus.success));
//     },);
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/Utils/enums.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_event.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart' hide PostsEvent;
import 'package:learn_flutter_bloc/repository/posts_repo.dart';

class PostBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepo postsRepo = PostsRepo();
  PostBloc() : super(PostsState()) {
    on<FetchPostsEvent>(fetchPosts);
  }

  void fetchPosts(FetchPostsEvent event, Emitter<PostsState> emit) async {
    await postsRepo.fetchPosts().then(
      (value) {
        emit(state.copyWith(listOfPosts: value, status: PostStatus.success));
      },
    );
  }
}
