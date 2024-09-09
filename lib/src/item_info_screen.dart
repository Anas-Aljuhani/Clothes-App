import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/src/update_item_screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/container/select_color_container.dart';
import 'package:flutter/material.dart';

class ItemInfoScreen extends StatelessWidget {
  


  final ItemModel itemModel;
  const ItemInfoScreen(
      {super.key,
    required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Item info',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                itemModel.img,
              ),
              SizedBox(
                height: context.getHeight() * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemModel.itemName,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${itemModel.price} Rs',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0x34000000)),
                  )
                ],
              ),
              SizedBox(
                height: context.getHeight() * 0.06,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const Text(
                      'Size',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: context.getHeight() * 0.01,
                    ),
                    Text(itemModel.size,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: context.getHeight() * 0.04,
                    ),
                    const Text(
                      'Color',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: context.getHeight() * 0.01,
                    ),
                    SelectColorContainer(color: itemModel.color )
                  ],
                ),
              ),
              const Spacer(),
              CustomeTextButton(
                buttonText: 'Update item',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UpdateItemScreen(itemModel: itemModel,),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
