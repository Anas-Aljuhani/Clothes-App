import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/home_screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/container/select_color_container.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String itemName = "";

  String price = "";

  String size = "";

  Color? color = Colors.blue;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color selectedColor;
    return Form(
      key: formKey,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.getHeight() * 0.09,
                ),
                const Text(
                  'Add item',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.getHeight() * 0.09,
                ),
                CustomTextField(
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Item name is required';
                      }
                      itemName = value;
                      return null;
                    },
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
                        getIt.get<AppModel>().addItem(
                            itemName: itemName,
                            price: price,
                            size: size,
                            color: color!);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ));
                      }
                    },
                    buttonText: 'Add')
              ],
            ),
          ),
        ),
      )),
    );
  }
}
