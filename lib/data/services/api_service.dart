import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';

abstract class ApiService {
  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProducts({
    String? categoryId,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    bool? onlyZeroCostEmi,
    String? sortBy, // 'price_asc', 'price_desc', 'rating', 'popular', 'emi_asc'
  });

  Future<ProductModel?> getProductById(String id);

  Future<OrderModel> submitEmiOrder(OrderModel order);
}
