import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/Utils/enums.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_event.dart';
import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart' hide PostsEvent;
import 'package:learn_flutter_bloc/model/posts_model.dart';
import 'package:learn_flutter_bloc/repository/posts_repo.dart';

class PostBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepo postsRepo = PostsRepo();
  List<PostsModel> tempPostList = [];
  PostBloc() : super(PostsState()) {
    on<FetchPostsEvent>(fetchPosts);
    on<SearchPostEvent>(filterPosts);
  }

  void fetchPosts(FetchPostsEvent event, Emitter<PostsState> emit) async {
    await postsRepo.fetchPosts().then(
      (value) {
        emit(state.copyWith(listOfPosts: value, status: PostStatus.success));
      },
    );
  }

  void filterPosts(SearchPostEvent event, Emitter<PostsState> emit) async {
    if(event.searchText.isEmpty){
      emit(state.copyWith(tempListOfPosts: [],  searchMesg: ''));// its mean your search is empty thatswhy we pass empty list and searchMesg declare as empty.
    }else{
      tempPostList = state.listOfPosts.where((element) => element.id.toString() == event.searchText).toList();
      if(tempPostList.isEmpty){
        emit(state.copyWith(tempListOfPosts: tempPostList, searchMesg: 'No Data Found'));
      }else{
        emit(state.copyWith(tempListOfPosts: tempPostList, status: PostStatus.success));
      }
    }
  }
}
