import '../../model/fav_item_model.dart';

abstract class FavouriteEvent {}

class FecthFavouriteEvent extends FavouriteEvent {}

class AddFavouriteEvent extends FavouriteEvent{
  final FavItemModel favItemModel;
  AddFavouriteEvent({required this.favItemModel});
}

class SelectItem extends FavouriteEvent{
  final FavItemModel favItemModel;
  SelectItem({required this.favItemModel});
}

class UnSelectItem extends FavouriteEvent{
  final FavItemModel favItemModel;
  UnSelectItem({required this.favItemModel});
}

class DeleteItem extends FavouriteEvent{}
