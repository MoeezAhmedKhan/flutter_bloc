class FavItemModel{
  int id;
  String value;
  bool isSelected;
  bool isDelete;

  FavItemModel({required this.id, required this.value, this.isSelected = false, this.isDelete = false});

  FavItemModel copyWith({int? id, String? value, bool? isSelected, bool? isDelete}) {
    return FavItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
      isDelete: isDelete ?? this.isDelete,
    );
  }
}