import 'package:learn_flutter_bloc/model/fav_item_model.dart';

class FavouriteRepo{
  Future<List<FavItemModel>> fetchFavItems() async{
    Future.delayed(const Duration(seconds: 3));
    return _generateList(10);
  }

  Future<List<FavItemModel>> _generateList(int length) async{
    return List.generate(length, (index) => FavItemModel(id: index, value: "Item $index"),);
  }
}