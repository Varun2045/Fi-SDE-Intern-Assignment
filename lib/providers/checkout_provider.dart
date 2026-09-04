import 'package:flutter/material.dart';
import '../data/models/emi_plan_model.dart';
import '../data/models/order_model.dart';
import '../data/models/product_model.dart';
import '../data/models/product_variant_model.dart';
import '../data/services/api_service.dart';

class CheckoutProvider extends ChangeNotifier {
  final ApiService apiService;

  CheckoutProvider({required this.apiService});

  bool _isProcessing = false;
  String? _errorMessage;
  OrderModel? _confirmedOrder;

  // Pre-approved credit limit for 1Fi user simulation
  final double preApprovedCreditLimit = 250000.0;
  final String userKycStatus = 'Verified (1Fi Tier 1)';

  String deliveryAddress = 'Flat 402, Green Glen Heights, Outer Ring Road, Bellandur, Bangalore - 560103';

  bool get isProcessing => _isProcessing;
  String? get errorMessage => _errorMessage;
  OrderModel? get confirmedOrder => _confirmedOrder;

  void updateDeliveryAddress(String address) {
    deliveryAddress = address;
    notifyListeners();
  }

  Future<bool> processOrder({
    required ProductModel product,
    required ColorVariant color,
    required StorageVariant storage,
    required EmiPlanModel emiPlan,
  }) async {
    _isProcessing = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final orderNumber = '1FI-ORD-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      final loanAgreementNumber = '1FI-LOAN-2026-${(1000 + DateTime.now().millisecond)}';

      final newOrder = OrderModel(
        orderId: orderNumber,
        product: product,
        selectedColor: color,
        selectedStorage: storage,
        selectedEmiPlan: emiPlan,
        finalPrice: storage.price,
        orderDate: DateTime.now(),
        deliveryAddress: deliveryAddress,
        loanAgreementNumber: loanAgreementNumber,
      );

      final result = await apiService.submitEmiOrder(newOrder);
      _confirmedOrder = result;
      _isProcessing = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Loan processing failed. Please try again.';
      _isProcessing = false;
      notifyListeners();
      return false;
    }
  }

  void reset() {
    _confirmedOrder = null;
    _errorMessage = null;
    _isProcessing = false;
  }
}
