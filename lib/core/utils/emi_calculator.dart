import 'dart:math';

/// EMI calculation engine and loan amortization breakdown
class EmiCalculator {
  /// Calculates monthly installment for standard or no-cost EMI
  /// [principal] - Net loan amount (Product Price minus Down Payment)
  /// [annualInterestRate] - Annual interest percentage (e.g. 14.5 for 14.5%, or 0 for No-Cost EMI)
  /// [tenureMonths] - Number of months (3, 6, 9, 12, etc.)
  static double calculateMonthlyEmi({
    required double principal,
    required double annualInterestRate,
    required int tenureMonths,
  }) {
    if (principal <= 0 || tenureMonths <= 0) return 0;
    if (annualInterestRate <= 0) {
      // 0% No-cost EMI
      return principal / tenureMonths;
    }

    // Monthly interest rate in decimal
    final double monthlyRate = annualInterestRate / (12 * 100);

    // Standard Amortization formula: P * r * (1 + r)^n / ((1 + r)^n - 1)
    final double compoundFactor = pow(1 + monthlyRate, tenureMonths).toDouble();
    final double emi = principal * monthlyRate * compoundFactor / (compoundFactor - 1);
    return emi;
  }

  /// Calculates total interest paid over the loan duration
  static double calculateTotalInterest({
    required double monthlyEmi,
    required int tenureMonths,
    required double principal,
  }) {
    final double totalPayable = monthlyEmi * tenureMonths;
    final double interest = totalPayable - principal;
    return max(0, interest);
  }

  /// Generates month-by-month repayment schedule
  static List<EmiScheduleItem> generateSchedule({
    required double principal,
    required double annualInterestRate,
    required int tenureMonths,
  }) {
    final List<EmiScheduleItem> schedule = [];
    final double monthlyEmi = calculateMonthlyEmi(
      principal: principal,
      annualInterestRate: annualInterestRate,
      tenureMonths: tenureMonths,
    );

    double remainingBalance = principal;
    final double monthlyRate = annualInterestRate / (12 * 100);

    for (int month = 1; month <= tenureMonths; month++) {
      final double interestForMonth = annualInterestRate > 0 ? remainingBalance * monthlyRate : 0.0;
      final double principalForMonth = monthlyEmi - interestForMonth;
      remainingBalance = max(0, remainingBalance - principalForMonth);

      schedule.add(
        EmiScheduleItem(
          monthNumber: month,
          monthlyInstallment: monthlyEmi,
          principalAmount: principalForMonth,
          interestAmount: interestForMonth,
          remainingBalance: remainingBalance,
        ),
      );
    }

    return schedule;
  }
}

class EmiScheduleItem {
  final int monthNumber;
  final double monthlyInstallment;
  final double principalAmount;
  final double interestAmount;
  final double remainingBalance;

  const EmiScheduleItem({
    required this.monthNumber,
    required this.monthlyInstallment,
    required this.principalAmount,
    required this.interestAmount,
    required this.remainingBalance,
  });
}
