import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_marketplace/core/utils/currency_formatter.dart';
import 'package:onefi_marketplace/core/utils/emi_calculator.dart';
import 'package:onefi_marketplace/data/models/emi_plan_model.dart';

void main() {
  group('EmiCalculator Unit Tests', () {
    test('Calculates 0% No-Cost EMI accurately', () {
      const double principal = 120000.0;
      const int tenure = 6;

      final emi = EmiCalculator.calculateMonthlyEmi(
        principal: principal,
        annualInterestRate: 0.0,
        tenureMonths: tenure,
      );

      expect(emi, equals(20000.0));
    });

    test('Calculates standard interest EMI accurately using amortization formula', () {
      const double principal = 100000.0;
      const double rate = 12.0; // 12% p.a. (1% per month)
      const int tenure = 12;

      final emi = EmiCalculator.calculateMonthlyEmi(
        principal: principal,
        annualInterestRate: rate,
        tenureMonths: tenure,
      );

      // Standard amortization monthly installment for 1L @ 12% for 12 months is ~8884.88
      expect(emi, closeTo(8884.88, 1.0));
    });

    test('Calculates total interest correctly', () {
      final interest = EmiCalculator.calculateTotalInterest(
        monthlyEmi: 8884.88,
        tenureMonths: 12,
        principal: 100000.0,
      );

      expect(interest, closeTo(6618.56, 2.0));
    });

    test('Generates month-by-month repayment schedule matching tenure length', () {
      final schedule = EmiCalculator.generateSchedule(
        principal: 60000.0,
        annualInterestRate: 10.0,
        tenureMonths: 6,
      );

      expect(schedule.length, equals(6));
      expect(schedule.last.remainingBalance, closeTo(0.0, 1.0));
    });
  });

  group('CurrencyFormatter Tests', () {
    test('Formats Indian Rupee figures with thousand separators', () {
      expect(CurrencyFormatter.format(144900), contains('1,44,900'));
      expect(CurrencyFormatter.calculateDiscountPercent(100000, 80000), equals(20));
    });
  });

  group('EmiPlanModel Cost Breakdown Tests', () {
    test('Calculates Zero Cost savings vs standard market rates', () {
      const plan = EmiPlanModel(
        id: 'test_plan',
        tenureMonths: 12,
        annualInterestRate: 0.0,
        isZeroCost: true,
      );

      final savings = plan.getZeroCostSavings(100000.0);
      expect(savings, greaterThan(0));
    });
  });
}
