import '../../core/utils/emi_calculator.dart';

class EmiPlanModel {
  final String id;
  final int tenureMonths;
  final double annualInterestRate;
  final bool isZeroCost;
  final double processingFee;
  final double downPayment;
  final String? specialOfferTag;

  const EmiPlanModel({
    required this.id,
    required this.tenureMonths,
    this.annualInterestRate = 0.0,
    this.isZeroCost = false,
    this.processingFee = 0.0,
    this.downPayment = 0.0,
    this.specialOfferTag,
  });

  /// Dynamic Monthly Installment for a given product price
  double getMonthlyEmi(double productPrice) {
    final double principal = productPrice - downPayment;
    return EmiCalculator.calculateMonthlyEmi(
      principal: principal,
      annualInterestRate: annualInterestRate,
      tenureMonths: tenureMonths,
    );
  }

  /// Dynamic Total Interest for a given product price
  double getTotalInterest(double productPrice) {
    if (isZeroCost) return 0.0;
    final double principal = productPrice - downPayment;
    final double monthly = getMonthlyEmi(productPrice);
    return EmiCalculator.calculateTotalInterest(
      monthlyEmi: monthly,
      tenureMonths: tenureMonths,
      principal: principal,
    );
  }

  /// Total Payable = (Monthly EMI * Months) + Down Payment + Processing Fee
  double getTotalPayable(double productPrice) {
    final double monthly = getMonthlyEmi(productPrice);
    return (monthly * tenureMonths) + downPayment + processingFee;
  }

  /// Total Savings on No-cost EMI compared to standard market loan rate (e.g. 15%)
  double getZeroCostSavings(double productPrice) {
    if (!isZeroCost) return 0.0;
    final double standardEmi = EmiCalculator.calculateMonthlyEmi(
      principal: productPrice,
      annualInterestRate: 15.0,
      tenureMonths: tenureMonths,
    );
    return (standardEmi * tenureMonths) - productPrice;
  }

  factory EmiPlanModel.fromJson(Map<String, dynamic> json) {
    return EmiPlanModel(
      id: json['id'] as String,
      tenureMonths: json['tenureMonths'] as int,
      annualInterestRate: (json['annualInterestRate'] as num?)?.toDouble() ?? 0.0,
      isZeroCost: json['isZeroCost'] as bool? ?? false,
      processingFee: (json['processingFee'] as num?)?.toDouble() ?? 0.0,
      downPayment: (json['downPayment'] as num?)?.toDouble() ?? 0.0,
      specialOfferTag: json['specialOfferTag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenureMonths': tenureMonths,
      'annualInterestRate': annualInterestRate,
      'isZeroCost': isZeroCost,
      'processingFee': processingFee,
      'downPayment': downPayment,
      'specialOfferTag': specialOfferTag,
    };
  }
}
