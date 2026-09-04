import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_marketplace/data/services/mock_api_service.dart';
import 'package:onefi_marketplace/main.dart';

void main() {
  testWidgets('App renders 1Fi Shop page with 3 tabs and hero banner', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      OneFiMarketplaceApp(apiService: MockApiService(simulatedDelayMs: 0)),
    );
    await tester.pumpAndSettle();

    // Verify 1Fi Hero Headline
    expect(find.text('Shop today,\nPay later using\nMutual funds.'), findsOneWidget);

    // Verify 3 assignment tabs
    expect(find.text('Top Brands'), findsOneWidget);
    expect(find.text('Nearby Stores'), findsOneWidget);
    expect(find.text('1Fi Marketplace'), findsOneWidget);

    // Verify 1Fi Bottom Navigation items
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('EMI Dues'), findsOneWidget);
    expect(find.text('Limit'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
