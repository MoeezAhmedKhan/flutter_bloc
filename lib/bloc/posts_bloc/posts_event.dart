abstract class PostsEvent {}

class FetchPostsEvent extends PostsEvent {}

class SearchPostEvent extends PostsEvent{
  String searchText;
  SearchPostEvent({required this.searchText});
}
