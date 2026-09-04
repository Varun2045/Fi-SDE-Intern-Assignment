import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final String? bannerSubtitle;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.bannerSubtitle,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: Icons.category,
      bannerSubtitle: json['bannerSubtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bannerSubtitle': bannerSubtitle,
    };
  }
}
