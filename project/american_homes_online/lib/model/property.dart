import 'package:flutter/material.dart';

class Property {
  final String property_id;
  final String property_image;
  final String price;
  final String property_title;
  final String property_address;
  final String property_action_category;
  final String property_rooms;
  final String property_bedrooms;
  final String property_size;
  final String property_latitude;
  final String property_longitude;

  Property(
      {this.property_id,
      this.property_image,
      this.price,
      this.property_title,
      this.property_address,
      this.property_action_category,
      this.property_rooms,
      this.property_bedrooms,
      this.property_size,
      this.property_latitude,
      this.property_longitude});

  factory Property.fromJson(Map<String, dynamic> json) {
    return new Property(
      property_id: json['property_id'],
      property_image: json['property_image'],
      price: json['price'],
      property_title: json['property_title'],
      property_address: json['property_address'],
      property_action_category: json['property_action_category'],
      property_rooms: json['property_rooms'],
      property_bedrooms: json['property_bedrooms'],
      property_size: json['property_size'],
      property_latitude: json['property_latitude'],
      property_longitude: json['property_longitude'],
    );
  }
}
