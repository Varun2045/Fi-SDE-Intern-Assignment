import 'package:flutter/material.dart';
import '../data/models/emi_plan_model.dart';
import '../data/models/product_model.dart';
import '../data/models/product_variant_model.dart';

class ProductDetailProvider extends ChangeNotifier {
  final ProductModel product;

  late ColorVariant _selectedColor;
  late StorageVariant _selectedStorage;
  late EmiPlanModel _selectedEmiPlan;
  int _activeImageIndex = 0;

  ProductDetailProvider({required this.product}) {
    _selectedColor = product.colorVariants.isNotEmpty
        ? product.colorVariants.first
        : const ColorVariant(id: 'c_default', name: 'Default', color: Colors.grey);

    _selectedStorage = product.storageVariants.isNotEmpty
        ? product.storageVariants.first
        : StorageVariant(
            id: 's_default',
            label: 'Standard',
            price: product.basePrice,
            originalPrice: product.originalPrice,
          );

    _selectedEmiPlan = product.emiPlans.isNotEmpty
        ? (product.emiPlans.firstWhere((p) => p.isZeroCost, orElse: () => product.emiPlans.first))
        : const EmiPlanModel(id: 'default_emi', tenureMonths: 12, annualInterestRate: 0);
  }

  // Getters
  ColorVariant get selectedColor => _selectedColor;
  StorageVariant get selectedStorage => _selectedStorage;
  EmiPlanModel get selectedEmiPlan => _selectedEmiPlan;
  int get activeImageIndex => _activeImageIndex;

  double get currentPrice => _selectedStorage.price;
  double get currentOriginalPrice => _selectedStorage.originalPrice;
  double get currentMonthlyEmi => _selectedEmiPlan.getMonthlyEmi(currentPrice);
  double get currentTotalInterest => _selectedEmiPlan.getTotalInterest(currentPrice);
  double get currentTotalPayable => _selectedEmiPlan.getTotalPayable(currentPrice);
  double get currentSavings => _selectedEmiPlan.getZeroCostSavings(currentPrice);

  void selectColor(ColorVariant color) {
    if (_selectedColor.id == color.id) return;
    _selectedColor = color;
    notifyListeners();
  }

  void selectStorage(StorageVariant storage) {
    if (_selectedStorage.id == storage.id) return;
    _selectedStorage = storage;
    notifyListeners();
  }

  void selectEmiPlan(EmiPlanModel plan) {
    if (_selectedEmiPlan.id == plan.id) return;
    _selectedEmiPlan = plan;
    notifyListeners();
  }

  void setActiveImageIndex(int index) {
    if (_activeImageIndex == index) return;
    _activeImageIndex = index;
    notifyListeners();
  }
}
