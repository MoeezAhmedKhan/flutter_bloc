import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:learn_flutter_bloc/bloc/favourite_bloc/favourite_state.dart';
import 'package:learn_flutter_bloc/model/fav_item_model.dart';

import '../../bloc/favourite_bloc/favourite_event.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FecthFavouriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return  Visibility(
                visible: state.tempFavItemlist.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: IconButton(onPressed: () {
                    if(state.tempFavItemlist.isNotEmpty){
                      context.read<FavouriteBloc>().add(DeleteItem());
                    }
                  }, icon: const Icon(Icons.delete, color: Colors.white,)),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.Loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.Failure:
              return const Center(child: Text("Error"));
            case ListStatus.Success:
              return ListView.builder(
                itemCount: state.favItemlist.length,
                itemBuilder: (context, index) {
                  final item = state.favItemlist[index];
                  return Card(
                    color: Colors.purple,
                    elevation: 4.0,
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: Checkbox(
                        value: state.tempFavItemlist.contains(item) ? true : false,
                        onChanged: (value) {
                          if (value!) {
                            context.read<FavouriteBloc>().add(SelectItem(favItemModel: item));
                          } else {
                            context.read<FavouriteBloc>().add(UnSelectItem(favItemModel: item));
                          }
                        },
                      ),
                      title: Text("${item.value}"),
                      trailing: IconButton(
                          onPressed: () {
                            FavItemModel newItem = FavItemModel(
                              id: item.id,
                              value: item.value,
                              isSelected: item.isSelected ? false : true,
                            );
                            context.read<FavouriteBloc>().add(AddFavouriteEvent(favItemModel: newItem));
                          },
                          icon: Icon(item.isSelected ? Icons.favorite : Icons.favorite_border, color: Colors.white)),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
