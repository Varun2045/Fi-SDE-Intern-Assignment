import 'emi_plan_model.dart';
import 'product_model.dart';
import 'product_variant_model.dart';

class OrderModel {
  final String orderId;
  final ProductModel product;
  final ColorVariant selectedColor;
  final StorageVariant selectedStorage;
  final EmiPlanModel selectedEmiPlan;
  final double finalPrice;
  final DateTime orderDate;
  final String deliveryAddress;
  final String status;
  final String loanAgreementNumber;

  const OrderModel({
    required this.orderId,
    required this.product,
    required this.selectedColor,
    required this.selectedStorage,
    required this.selectedEmiPlan,
    required this.finalPrice,
    required this.orderDate,
    required this.deliveryAddress,
    this.status = 'Approved & Loan Disbursed',
    required this.loanAgreementNumber,
  });

  DateTime get firstEmiDueDate => orderDate.add(const Duration(days: 30));
}
