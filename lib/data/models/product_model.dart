import 'emi_plan_model.dart';
import 'product_variant_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String categoryId;
  final double basePrice;
  final double originalPrice;
  final String thumbnail;
  final List<String> images;
  final String description;
  final List<String> keyFeatures;
  final Map<String, String> specifications;
  final double rating;
  final int ratingCount;
  final String? badge;
  final bool isZeroCostEmiAvailable;
  final List<ColorVariant> colorVariants;
  final List<StorageVariant> storageVariants;
  final List<EmiPlanModel> emiPlans;
  final String warrantyInfo;
  final String deliveryEstimate;

  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.categoryId,
    required this.basePrice,
    required this.originalPrice,
    required this.thumbnail,
    required this.images,
    required this.description,
    required this.keyFeatures,
    required this.specifications,
    this.rating = 4.5,
    this.ratingCount = 120,
    this.badge,
    this.isZeroCostEmiAvailable = true,
    required this.colorVariants,
    required this.storageVariants,
    required this.emiPlans,
    this.warrantyInfo = '1 Year Brand Warranty',
    this.deliveryEstimate = 'Free Delivery in 2-3 Days',
  });

  /// Lowest starting monthly EMI across all available plans
  double get minMonthlyEmi {
    if (emiPlans.isEmpty) return basePrice / 12;
    double minEmi = double.infinity;
    for (final plan in emiPlans) {
      final emi = plan.getMonthlyEmi(basePrice);
      if (emi < minEmi) {
        minEmi = emi;
      }
    }
    return minEmi == double.infinity ? basePrice / 12 : minEmi;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      categoryId: json['categoryId'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      thumbnail: json['thumbnail'] as String,
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      keyFeatures: (json['keyFeatures'] as List<dynamic>).map((e) => e as String).toList(),
      specifications: Map<String, String>.from(json['specifications'] as Map),
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      ratingCount: json['ratingCount'] as int? ?? 100,
      badge: json['badge'] as String?,
      isZeroCostEmiAvailable: json['isZeroCostEmiAvailable'] as bool? ?? true,
      colorVariants: (json['colorVariants'] as List<dynamic>?)
              ?.map((e) => ColorVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      storageVariants: (json['storageVariants'] as List<dynamic>?)
              ?.map((e) => StorageVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      emiPlans: (json['emiPlans'] as List<dynamic>?)
              ?.map((e) => EmiPlanModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      warrantyInfo: json['warrantyInfo'] as String? ?? '1 Year Brand Warranty',
      deliveryEstimate: json['deliveryEstimate'] as String? ?? 'Free Delivery in 2-3 Days',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'categoryId': categoryId,
      'basePrice': basePrice,
      'originalPrice': originalPrice,
      'thumbnail': thumbnail,
      'images': images,
      'description': description,
      'keyFeatures': keyFeatures,
      'specifications': specifications,
      'rating': rating,
      'ratingCount': ratingCount,
      'badge': badge,
      'isZeroCostEmiAvailable': isZeroCostEmiAvailable,
      'colorVariants': colorVariants.map((e) => e.toJson()).toList(),
      'storageVariants': storageVariants.map((e) => e.toJson()).toList(),
      'emiPlans': emiPlans.map((e) => e.toJson()).toList(),
      'warrantyInfo': warrantyInfo,
      'deliveryEstimate': deliveryEstimate,
    };
  }
}
