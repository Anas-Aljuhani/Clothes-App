import 'package:clothes_app/bloc/bloc_item/item_handle_bloc.dart';
import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/item_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemInfoScreen(
              itemModel: itemModel,
            ),
          )),
      child: Container(
        width: context.getWidth() * 0.35,
        height: context.getHeight() * 0.25,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  itemModel.img,
                  height: context.getHeight() * 0.18,
                  width: context.getWidth() * 0.35,
                ),
                Positioned(
                  left: (context.getWidth() * 0.35) / 1.7,
                  child: IconButton(
                    onPressed: () {
                      getIt.get<AppModel>().removeItem(id: itemModel.id);

                      context.read<ItemHandleBloc>().add(ShowItemEvent());
                    },
                    icon: const Icon(Icons.delete),
                    color: const Color.fromARGB(255, 207, 55, 55),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemModel.itemName,
                  style: const TextStyle(
                      color: Color(0x34000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text('${itemModel.price} Rs',
                    style: const TextStyle(
                        color: Color(0x34000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 15))
              ],
            )
          ],
        ),
      ),
    );
  }
}
