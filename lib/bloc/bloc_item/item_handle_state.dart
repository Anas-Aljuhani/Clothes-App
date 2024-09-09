part of 'item_handle_bloc.dart';

@immutable
sealed class ItemHandleState {}

final class ItemHandleInitial extends ItemHandleState {
  final List<ItemModel> itemList;

  ItemHandleInitial({required this.itemList});
}

final class ShowItemState extends ItemHandleState {
  final List<ItemModel> itemList;

  ShowItemState({required this.itemList});
}
