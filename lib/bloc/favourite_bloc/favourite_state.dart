import 'package:learn_flutter_bloc/model/fav_item_model.dart';

enum ListStatus{Loading, Success, Failure}
class FavouriteState{
  final List<FavItemModel> favItemlist;
  final List<FavItemModel> tempFavItemlist;
  ListStatus status;
  FavouriteState({this.favItemlist = const [], this.status = ListStatus.Loading, this.tempFavItemlist = const []});

  FavouriteState copyWith({
    List<FavItemModel>? favItemlist,
    List<FavItemModel>? tempFavItemlist,
    ListStatus? status,
  }) {
    return FavouriteState(
      favItemlist: favItemlist ?? this.favItemlist,
      tempFavItemlist: tempFavItemlist ?? this.tempFavItemlist,
      status: status ?? this.status,
    );
  }

}