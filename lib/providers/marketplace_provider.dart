import 'package:flutter/material.dart';
import '../data/models/category_model.dart';
import '../data/models/product_model.dart';
import '../data/services/api_service.dart';

class MarketplaceProvider extends ChangeNotifier {
  final ApiService apiService;

  MarketplaceProvider({required this.apiService});

  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  bool _isLoading = false;
  bool _isCategoriesLoading = false;
  String? _errorMessage;

  String _selectedCategoryId = 'all';
  String _searchQuery = '';
  String _sortBy = 'popular';
  bool _onlyZeroCostEmi = false;
  double? _minPrice;
  double? _maxPrice;

  // Getters
  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  bool get isCategoriesLoading => _isCategoriesLoading;
  String? get errorMessage => _errorMessage;
  String get selectedCategoryId => _selectedCategoryId;
  String get searchQuery => _searchQuery;
  String get sortBy => _sortBy;
  bool get onlyZeroCostEmi => _onlyZeroCostEmi;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;

  CategoryModel? get activeCategory {
    try {
      return _categories.firstWhere((c) => c.id == _selectedCategoryId);
    } catch (_) {
      return null;
    }
  }

  bool get hasActiveFilters =>
      _searchQuery.isNotEmpty ||
      _selectedCategoryId != 'all' ||
      _onlyZeroCostEmi ||
      _minPrice != null ||
      _maxPrice != null ||
      _sortBy != 'popular';

  Future<void> initialize() async {
    await fetchCategories();
    await fetchProducts();
  }

  Future<void> fetchCategories() async {
    _isCategoriesLoading = true;
    notifyListeners();
    try {
      _categories = await apiService.getCategories();
    } catch (e) {
      _errorMessage = 'Failed to load categories: $e';
    } finally {
      _isCategoriesLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await apiService.getProducts(
        categoryId: _selectedCategoryId,
        searchQuery: _searchQuery,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        onlyZeroCostEmi: _onlyZeroCostEmi,
        sortBy: _sortBy,
      );
    } catch (e) {
      _errorMessage = 'Failed to load products. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String categoryId) {
    if (_selectedCategoryId == categoryId) return;
    _selectedCategoryId = categoryId;
    fetchProducts();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    fetchProducts();
  }

  void setSortBy(String sort) {
    _sortBy = sort;
    fetchProducts();
  }

  void setFilters({
    bool? onlyZeroCost,
    double? min,
    double? max,
    String? sort,
  }) {
    if (onlyZeroCost != null) _onlyZeroCostEmi = onlyZeroCost;
    _minPrice = min;
    _maxPrice = max;
    if (sort != null) _sortBy = sort;
    fetchProducts();
  }

  void resetFilters() {
    _searchQuery = '';
    _selectedCategoryId = 'all';
    _sortBy = 'popular';
    _onlyZeroCostEmi = false;
    _minPrice = null;
    _maxPrice = null;
    fetchProducts();
  }
}
