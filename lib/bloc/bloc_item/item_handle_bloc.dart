
import 'package:bloc/bloc.dart';
import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:meta/meta.dart';

part 'item_handle_event.dart';
part 'item_handle_state.dart';

class ItemHandleBloc extends Bloc<ItemHandleEvent, ItemHandleState> {
  List<ItemModel> itemList = getIt.get<AppModel>().itemList;
  ItemHandleBloc()
      : super(ItemHandleInitial(itemList: getIt.get<AppModel>().itemList)) {
    on<ShowItemEvent>((event, emit) {
      emit(ShowItemState(itemList: itemList));
    });
  }
}
