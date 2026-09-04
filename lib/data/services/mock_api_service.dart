import '../mock/mock_products_data.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import 'api_service.dart';

class MockApiService implements ApiService {
  final int simulatedDelayMs;

  MockApiService({this.simulatedDelayMs = 400});

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(Duration(milliseconds: simulatedDelayMs));
    return List<CategoryModel>.from(MockProductsData.categories);
  }

  @override
  Future<List<ProductModel>> getProducts({
    String? categoryId,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    bool? onlyZeroCostEmi,
    String? sortBy,
  }) async {
    await Future.delayed(Duration(milliseconds: simulatedDelayMs));

    List<ProductModel> filtered = List<ProductModel>.from(MockProductsData.products);

    // Filter by Category
    if (categoryId != null && categoryId != 'all') {
      filtered = filtered.where((p) => p.categoryId.toLowerCase() == categoryId.toLowerCase()).toList();
    }

    // Filter by Search Query
    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final query = searchQuery.toLowerCase().trim();
      filtered = filtered.where((p) {
        final matchesName = p.name.toLowerCase().contains(query);
        final matchesBrand = p.brand.toLowerCase().contains(query);
        final matchesDesc = p.description.toLowerCase().contains(query);
        final matchesSpecs = p.specifications.values.any((val) => val.toLowerCase().contains(query));
        return matchesName || matchesBrand || matchesDesc || matchesSpecs;
      }).toList();
    }

    // Filter by Price Range
    if (minPrice != null) {
      filtered = filtered.where((p) => p.basePrice >= minPrice).toList();
    }
    if (maxPrice != null) {
      filtered = filtered.where((p) => p.basePrice <= maxPrice).toList();
    }

    // Filter by Zero Cost EMI
    if (onlyZeroCostEmi == true) {
      filtered = filtered.where((p) => p.isZeroCostEmiAvailable).toList();
    }

    // Sorting logic
    if (sortBy != null) {
      switch (sortBy) {
        case 'price_asc':
          filtered.sort((a, b) => a.basePrice.compareTo(b.basePrice));
          break;
        case 'price_desc':
          filtered.sort((a, b) => b.basePrice.compareTo(a.basePrice));
          break;
        case 'rating':
          filtered.sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'emi_asc':
          filtered.sort((a, b) => a.minMonthlyEmi.compareTo(b.minMonthlyEmi));
          break;
        case 'popular':
        default:
          filtered.sort((a, b) => b.ratingCount.compareTo(a.ratingCount));
          break;
      }
    }

    return filtered;
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    await Future.delayed(Duration(milliseconds: simulatedDelayMs));
    try {
      return MockProductsData.products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<OrderModel> submitEmiOrder(OrderModel order) async {
    await Future.delayed(Duration(milliseconds: simulatedDelayMs * 2));
    return order;
  }
}
