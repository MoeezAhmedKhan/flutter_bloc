import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/bloc/favourite_bloc/favourite_event.dart';

import '../../model/fav_item_model.dart';
import '../../repository/favourite_repo.dart';
import 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepo favouriteRepo;
  List<FavItemModel> favouriteList = [];
  List<FavItemModel> tempFavouriteList = [];
  FavouriteBloc(this.favouriteRepo) : super(FavouriteState()) {
    on<FecthFavouriteEvent>(fetcList);
    on<AddFavouriteEvent>(addFavItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetcList(FecthFavouriteEvent event, Emitter<FavouriteState> emit) async {
    favouriteList = await favouriteRepo.fetchFavItems();
    emit(state.copyWith(favItemlist: favouriteList, status: ListStatus.Success));
  }

  void addFavItem(AddFavouriteEvent event, Emitter<FavouriteState> emit) {
    final index = favouriteList.indexWhere((element) => element.id == event.favItemModel.id);
    if (event.favItemModel.isSelected) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.favItemModel);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.favItemModel);
      }
    }
    favouriteList[index] = event.favItemModel;
    emit(state.copyWith(favItemlist: favouriteList, status: ListStatus.Success, tempFavItemlist: tempFavouriteList));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteState> emit) {
    tempFavouriteList.add(event.favItemModel);
    emit(state.copyWith(tempFavItemlist: tempFavouriteList));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavouriteState> emit) {
    tempFavouriteList.remove(event.favItemModel);
    emit(state.copyWith(favItemlist: favouriteList, status: ListStatus.Success));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteState> emit) {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(state.copyWith(tempFavItemlist: tempFavouriteList, favItemlist: favouriteList));
  }
}
