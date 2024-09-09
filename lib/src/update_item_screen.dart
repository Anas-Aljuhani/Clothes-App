import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/home_screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/container/select_color_container.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class UpdateItemScreen extends StatefulWidget {
  const UpdateItemScreen({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  final formKey = GlobalKey<FormState>();

  late String itemName;
  late String price;
  late String size;
  late Color color;

  @override
  void initState() {
    itemName = widget.itemModel.itemName;
    price = widget.itemModel.price;
    size = widget.itemModel.size;
    color = widget.itemModel.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor;
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update item',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Item name is required';
                        }
                        itemName = value;
                        return null;
                      },
                      editTextValue: widget.itemModel.itemName,
                      hintText: 'item name',
                      hasSuffixIcon: false),
                  SizedBox(
                    height: context.getHeight() * 0.04,
                  ),
                  CustomTextField(
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is required';
                        }
                        final doubleValue = double.tryParse(value);
                        if (doubleValue == null) {
                          return 'Enter a valid price';
                        }
                        price = value;
                        return null;
                      },
                      editTextValue: widget.itemModel.price,
                      hintText: 'price',
                      hasSuffixIcon: false),
                  SizedBox(
                    height: context.getHeight() * 0.04,
                  ),
                  CustomTextField(
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Size is required';
                        }
                        const validSizes = ['S', 'M', 'L', 'XL', 'XXL'];
                        if (!validSizes.contains(value)) {
                          return 'Enter a valid size (S, M, L, XL, XXL)';
                        }
                        size = value;
                        return null;
                      },
                      editTextValue: widget.itemModel.size,
                      hintText: 'size',
                      hasSuffixIcon: false),
                  SizedBox(
                    height: context.getHeight() * 0.04,
                  ),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.getHeight() * 0.04,
                  ),
                  Row(
                    children: [
                      SelectColorContainer(
                        color: Colors.red,
                        onTap: () {
                          selectedColor = Colors.red;
                          color = selectedColor;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 500),
                            content: const Text(
                              'Color is selected',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedColor,
                          ));
                        },
                      ),
                      SelectColorContainer(
                        color: Colors.blue,
                        onTap: () {
                          selectedColor = Colors.blue;
                          color = selectedColor;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 500),
                            content: const Text(
                              'Color is selected',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedColor,
                          ));
                        },
                      ),
                      SelectColorContainer(
                        color: Colors.green,
                        onTap: () {
                          selectedColor = Colors.green;
                          color = selectedColor;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 500),
                            content: const Text(
                              'Color is selected',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedColor,
                          ));
                        },
                      ),
                      SelectColorContainer(
                        color: Colors.amber,
                        onTap: () {
                          selectedColor = Colors.amber;
                          color = selectedColor;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 500),
                            content: const Text(
                              'Color is selected',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedColor,
                          ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getHeight() * 0.04,
                  ),
                  CustomeTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          getIt.get<AppModel>().updateItem(
                              itemName: itemName,
                              price: price,
                              size: size,
                              color: color,
                              id: widget.itemModel.id);

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ));
                        }
                      },
                      buttonText: 'Update')
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
