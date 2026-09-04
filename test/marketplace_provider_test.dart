import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_marketplace/data/services/mock_api_service.dart';
import 'package:onefi_marketplace/providers/marketplace_provider.dart';

void main() {
  group('MarketplaceProvider Tests', () {
    late MockApiService apiService;
    late MarketplaceProvider provider;

    setUp(() {
      apiService = MockApiService(simulatedDelayMs: 0);
      provider = MarketplaceProvider(apiService: apiService);
    });

    test('Initializes categories and products successfully', () async {
      await provider.initialize();

      expect(provider.categories.isNotEmpty, isTrue);
      expect(provider.products.isNotEmpty, isTrue);
      expect(provider.isLoading, isFalse);
      expect(provider.errorMessage, isNull);
    });

    test('Filters products by category', () async {
      await provider.initialize();
      provider.selectCategory('audio');
      await provider.fetchProducts();

      expect(provider.products.every((p) => p.categoryId == 'audio'), isTrue);
    });

    test('Searches products dynamically by query', () async {
      await provider.initialize();
      provider.setSearchQuery('iPhone');
      await provider.fetchProducts();

      expect(provider.products.isNotEmpty, isTrue);
      expect(provider.products.any((p) => p.name.contains('iPhone')), isTrue);
    });

    test('Filters by Zero-Cost EMI', () async {
      await provider.initialize();
      provider.setFilters(onlyZeroCost: true);
      await provider.fetchProducts();

      expect(provider.products.every((p) => p.isZeroCostEmiAvailable), isTrue);
    });

    test('Resets filters to default', () async {
      await provider.initialize();
      provider.selectCategory('gaming');
      provider.setSearchQuery('PlayStation');
      provider.resetFilters();
      await provider.fetchProducts();

      expect(provider.selectedCategoryId, equals('all'));
      expect(provider.searchQuery, isEmpty);
      expect(provider.hasActiveFilters, isFalse);
    });
  });
}
