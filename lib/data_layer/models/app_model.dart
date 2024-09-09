import 'dart:math';
import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/data_layer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppModel {
  final box = GetStorage();
  UserModel? user;

  List<String> randomImgList = [
    "assets/image/card_image1.png",
    "assets/image/card_image2.png",
    "assets/image/card_image3.png",
    "assets/image/card_image4.png",
  ];

  List<UserModel> userList = [];
  List<ItemModel> itemList = [];

  AppModel() {
    loadItem();
    loadUser();
  }

  void addUser(
      {required String name, required String password, required String email}) {
    userList.add(UserModel(
        email: email,
        name: name,
        password: password,
        id: Random().nextInt(99999)));
    saveUser();
  }

  bool userChecker({required String name, required String password}) {
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].name == name && userList[i].password == password) {
        user = userList[i];
        return true;
      }
    }
    return false;
  }

  void updateItem(
      {required String itemName,
      required String price,
      required String size,
      required Color color,
      required int id}) {
    for (var val in itemList) {
      if (val.id == id) {
        val.itemName = itemName;
        val.price = price;
        val.size = size;
        val.color = color;
      }
    }
    saveItem();
  }

  void removeItem({required int id}) {
    itemList.removeWhere((item) => item.id == id);
    saveItem();
  }

  void addItem(
      {required String itemName,
      required String price,
      required String size,
      required Color color}) {
    itemList.add(ItemModel(
        id: Random().nextInt(99999),
        itemName: itemName,
        price: price,
        size: size,
        color: color,
        img: randomImgList[Random().nextInt(randomImgList.length)]));
    saveItem();
  }

  Future<void> saveItem() async {
    List<Map<String, dynamic>> itemAsMap =
        itemList.map((item) => item.toJson()).toList();
    await box.write('items', itemAsMap);
  }

  Future<void> saveUser() async {
    List<Map<String, dynamic>> usersAsMap =
        userList.map((user) => user.toJson()).toList();
    await box.write('users', usersAsMap);
  }

  void loadItem() {
    if (box.hasData('items')) {
      List<dynamic> savedItem = box.read('items');
      itemList = savedItem.map((item) => ItemModel.fromJson(item)).toList();
    }
  }

  void loadUser() {
    if (box.hasData('users')) {
      List<dynamic> savedUser = box.read('users');
      userList = savedUser.map((user) => UserModel.formJson(user)).toList();
    }
  }
}
