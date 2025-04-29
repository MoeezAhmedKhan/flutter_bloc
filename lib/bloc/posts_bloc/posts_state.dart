import 'package:learn_flutter_bloc/bloc/posts_bloc/posts_state.dart';
import 'package:learn_flutter_bloc/model/posts_model.dart';

import '../../Utils/enums.dart';

abstract class PostsEvent {}

class PostsState {
  PostStatus status;
  List<PostsModel> listOfPosts;
  String errorMesg;
  List<PostsModel> tempListOfPosts;

  String searchMesg;




  PostsState({this.status = PostStatus.loading, this.listOfPosts = const [], this.errorMesg = "", this.tempListOfPosts = const [], this.searchMesg = ""});

  PostsState copyWith({PostStatus? status, List<PostsModel>? listOfPosts, String? errorMesg, List<PostsModel>? tempListOfPosts, String? searchMesg}) {
    return PostsState(status: status ?? this.status, listOfPosts: listOfPosts ?? this.listOfPosts, errorMesg: errorMesg ?? this.errorMesg, tempListOfPosts: tempListOfPosts ?? this.tempListOfPosts, searchMesg: searchMesg ?? this.searchMesg);
  }
}
