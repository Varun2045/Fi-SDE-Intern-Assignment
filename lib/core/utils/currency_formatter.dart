import 'package:intl/intl.dart';

/// Formatter for Indian Rupee currency and numbers
class CurrencyFormatter {
  static final NumberFormat _inrFormatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  static final NumberFormat _inrCompactFormatter = NumberFormat.compactCurrency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  /// Formats amount like ₹79,999
  static String format(num amount) {
    return _inrFormatter.format(amount);
  }

  /// Formats compact amount like ₹80K
  static String formatCompact(num amount) {
    return _inrCompactFormatter.format(amount);
  }

  /// Calculates percentage discount: ((original - current) / original * 100)
  static int calculateDiscountPercent(num originalPrice, num discountedPrice) {
    if (originalPrice <= 0 || originalPrice <= discountedPrice) return 0;
    return (((originalPrice - discountedPrice) / originalPrice) * 100).round();
  }
}
