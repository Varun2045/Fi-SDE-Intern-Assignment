import 'package:flutter/material.dart';

class ColorVariant {
  final String id;
  final String name;
  final Color color;
  final String? imageUrl;

  const ColorVariant({
    required this.id,
    required this.name,
    required this.color,
    this.imageUrl,
  });

  factory ColorVariant.fromJson(Map<String, dynamic> json) {
    return ColorVariant(
      id: json['id'] as String,
      name: json['name'] as String,
      color: Color(json['colorValue'] as int? ?? 0xFF000000),
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'colorValue': color.toARGB32(),
      'imageUrl': imageUrl,
    };
  }
}

class StorageVariant {
  final String id;
  final String label; // e.g. "128 GB", "256 GB", "512 GB", "1 TB"
  final double price;
  final double originalPrice;
  final bool inStock;

  const StorageVariant({
    required this.id,
    required this.label,
    required this.price,
    required this.originalPrice,
    this.inStock = true,
  });

  factory StorageVariant.fromJson(Map<String, dynamic> json) {
    return StorageVariant(
      id: json['id'] as String,
      label: json['label'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      inStock: json['inStock'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'price': price,
      'originalPrice': originalPrice,
      'inStock': inStock,
    };
  }
}
