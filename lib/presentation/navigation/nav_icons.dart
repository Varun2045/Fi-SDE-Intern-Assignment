import 'package:flutter/material.dart';

/// Production-grade unified outline icon set for 1Fi Navigation
/// Built with 24x24 standard optical grid, 2.0px stroke weight, rounded caps/joins.
class NavIcons {
  // 1. Home Icon
  static Widget home({required Color color, double size = 24, bool isActive = false}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HomeIconPainter(color: color, isActive: isActive),
    );
  }

  // 2. Shop Icon (Storefront with clean awning & entrance)
  static Widget shop({required Color color, double size = 24, bool isActive = true}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ShopIconPainter(color: color, isActive: isActive),
    );
  }

  // 3. EMI Dues Icon (Clean receipt with subtle Rupee ₹ indicator)
  static Widget emiDues({required Color color, double size = 24, bool isActive = false}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EmiDuesIconPainter(color: color, isActive: isActive),
    );
  }

  // 4. Limit Icon (3 ascending bars with upward trend arrow)
  static Widget limit({required Color color, double size = 24, bool isActive = false}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _LimitIconPainter(color: color, isActive: isActive),
    );
  }

  // 5. Profile Icon (Minimalist avatar head and shoulder arch)
  static Widget profile({required Color color, double size = 24, bool isActive = false}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ProfileIconPainter(color: color, isActive: isActive),
    );
  }
}

class _HomeIconPainter extends CustomPainter {
  final Color color;
  final bool isActive;

  _HomeIconPainter({required this.color, required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.2 : 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.width / 24.0;

    // Outer house silhouette
    final path = Path()
      ..moveTo(4 * s, 10.5 * s)
      ..lineTo(11.3 * s, 3.8 * s)
      ..arcToPoint(Offset(12.7 * s, 3.8 * s), radius: Radius.circular(1.5 * s))
      ..lineTo(20 * s, 10.5 * s)
      ..lineTo(20 * s, 19.5 * s)
      ..arcToPoint(Offset(18.5 * s, 21 * s), radius: Radius.circular(1.5 * s))
      ..lineTo(5.5 * s, 21 * s)
      ..arcToPoint(Offset(4 * s, 19.5 * s), radius: Radius.circular(1.5 * s))
      ..close();

    canvas.drawPath(path, stroke);

    // Centered rounded door arch
    final door = Path()
      ..moveTo(9.5 * s, 21 * s)
      ..lineTo(9.5 * s, 14.5 * s)
      ..arcToPoint(Offset(14.5 * s, 14.5 * s), radius: Radius.circular(2.5 * s))
      ..lineTo(14.5 * s, 21 * s);

    canvas.drawPath(door, stroke);
  }

  @override
  bool shouldRepaint(covariant _HomeIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isActive != isActive;
}

class _ShopIconPainter extends CustomPainter {
  final Color color;
  final bool isActive;

  _ShopIconPainter({required this.color, required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.2 : 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.width / 24.0;

    // 1. Clean Awning Canopy with 3 equal scallops
    final awning = Path()
      ..moveTo(5.5 * s, 4.5 * s)
      ..lineTo(18.5 * s, 4.5 * s)
      ..lineTo(20.5 * s, 10.5 * s)
      // 3 scalloped bottom waves
      ..arcToPoint(Offset(15.5 * s, 10.5 * s), radius: Radius.circular(2.5 * s), clockwise: false)
      ..arcToPoint(Offset(10.5 * s, 10.5 * s), radius: Radius.circular(2.5 * s), clockwise: false)
      ..arcToPoint(Offset(5.5 * s, 10.5 * s), radius: Radius.circular(2.5 * s), clockwise: false)
      ..lineTo(3.5 * s, 10.5 * s)
      ..close();

    canvas.drawPath(awning, stroke);

    // 2. Store Base Walls
    final body = Path()
      ..moveTo(5.5 * s, 11 * s)
      ..lineTo(5.5 * s, 19.5 * s)
      ..arcToPoint(Offset(7 * s, 21 * s), radius: Radius.circular(1.5 * s))
      ..lineTo(17 * s, 21 * s)
      ..arcToPoint(Offset(18.5 * s, 19.5 * s), radius: Radius.circular(1.5 * s))
      ..lineTo(18.5 * s, 11 * s);

    canvas.drawPath(body, stroke);

    // 3. Minimal Entrance Doorway
    final door = Path()
      ..moveTo(9.5 * s, 21 * s)
      ..lineTo(9.5 * s, 15 * s)
      ..arcToPoint(Offset(14.5 * s, 15 * s), radius: Radius.circular(2.5 * s))
      ..lineTo(14.5 * s, 21 * s);

    canvas.drawPath(door, stroke);
  }

  @override
  bool shouldRepaint(covariant _ShopIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isActive != isActive;
}

class _EmiDuesIconPainter extends CustomPainter {
  final Color color;
  final bool isActive;

  _EmiDuesIconPainter({required this.color, required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.2 : 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.width / 24.0;

    // 1. Geometric Receipt with serrated top and bottom edges (3 teeth)
    final receipt = Path()
      ..moveTo(5 * s, 4.5 * s)
      ..lineTo(7.3 * s, 3 * s)
      ..lineTo(9.6 * s, 4.5 * s)
      ..lineTo(12 * s, 3 * s)
      ..lineTo(14.4 * s, 4.5 * s)
      ..lineTo(16.7 * s, 3 * s)
      ..lineTo(19 * s, 4.5 * s)
      ..lineTo(19 * s, 19.5 * s)
      ..lineTo(16.7 * s, 21 * s)
      ..lineTo(14.4 * s, 19.5 * s)
      ..lineTo(12 * s, 21 * s)
      ..lineTo(9.6 * s, 19.5 * s)
      ..lineTo(7.3 * s, 21 * s)
      ..lineTo(5 * s, 19.5 * s)
      ..close();

    canvas.drawPath(receipt, stroke);

    // 2. High-legibility Indian Rupee (₹) indicator
    final rupee = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.0 : 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Top horizontal bar
    canvas.drawLine(Offset(8.5 * s, 8 * s), Offset(15.5 * s, 8 * s), rupee);
    // Second parallel horizontal bar
    canvas.drawLine(Offset(8.5 * s, 10.5 * s), Offset(14 * s, 10.5 * s), rupee);

    // Upper curve and diagonal 45° descending leg
    final leg = Path()
      ..moveTo(10.5 * s, 8 * s)
      ..lineTo(10.5 * s, 10.5 * s)
      ..arcToPoint(Offset(13.8 * s, 12 * s), radius: Radius.circular(2 * s))
      ..arcToPoint(Offset(10.5 * s, 13.8 * s), radius: Radius.circular(2 * s))
      ..lineTo(14.8 * s, 17.5 * s);

    canvas.drawPath(leg, rupee);
  }

  @override
  bool shouldRepaint(covariant _EmiDuesIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isActive != isActive;
}

class _LimitIconPainter extends CustomPainter {
  final Color color;
  final bool isActive;

  _LimitIconPainter({required this.color, required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.2 : 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.width / 24.0;

    // 3 ascending vertical bars
    canvas.drawLine(Offset(6.5 * s, 20.5 * s), Offset(6.5 * s, 15.5 * s), stroke);
    canvas.drawLine(Offset(11.5 * s, 20.5 * s), Offset(11.5 * s, 12 * s), stroke);
    canvas.drawLine(Offset(16.5 * s, 20.5 * s), Offset(16.5 * s, 8.5 * s), stroke);

    // Trend line
    final trend = Path()
      ..moveTo(4 * s, 16 * s)
      ..lineTo(9 * s, 11 * s)
      ..lineTo(13.5 * s, 13.5 * s)
      ..lineTo(20 * s, 5 * s);

    canvas.drawPath(trend, stroke);

    // Arrowhead
    final arrow = Path()
      ..moveTo(15.5 * s, 5 * s)
      ..lineTo(20 * s, 5 * s)
      ..lineTo(20 * s, 9.5 * s);

    canvas.drawPath(arrow, stroke);
  }

  @override
  bool shouldRepaint(covariant _LimitIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isActive != isActive;
}

class _ProfileIconPainter extends CustomPainter {
  final Color color;
  final bool isActive;

  _ProfileIconPainter({required this.color, required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 2.2 : 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.width / 24.0;

    // Head circle
    canvas.drawCircle(Offset(12 * s, 7.5 * s), 4 * s, stroke);

    // Shoulder arch
    final shoulder = Path()
      ..moveTo(4.5 * s, 20.5 * s)
      ..arcToPoint(
        Offset(19.5 * s, 20.5 * s),
        radius: Radius.circular(7.5 * s),
      );

    canvas.drawPath(shoulder, stroke);
  }

  @override
  bool shouldRepaint(covariant _ProfileIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isActive != isActive;
}
