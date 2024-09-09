import 'package:flutter/material.dart';

class ItemModel {
  final int id;
  String itemName;
  String price;
  String size;
  Color color;
  String img;

  ItemModel({
    required this.id,
    required this.itemName,
    required this.price,
    required this.size,
    required this.color,
    required this.img,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"],
      itemName: json["itemName"],
      price: json["price"],
      size: json["size"],
      color: Color(json["color"]),
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "itemName": itemName,
      "price": price,
      "size": size,
      "color": color.value,
      "img": img,
    };
  }
}
