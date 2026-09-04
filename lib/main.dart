import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'data/services/api_service.dart';
import 'data/services/mock_api_service.dart';
import 'presentation/navigation/main_nav_screen.dart';
import 'providers/checkout_provider.dart';
import 'providers/marketplace_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OneFiMarketplaceApp());
}

class OneFiMarketplaceApp extends StatelessWidget {
  final ApiService? apiService;

  const OneFiMarketplaceApp({super.key, this.apiService});

  @override
  Widget build(BuildContext context) {
    final effectiveApiService = apiService ?? MockApiService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarketplaceProvider(apiService: effectiveApiService)..initialize(),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckoutProvider(apiService: effectiveApiService),
        ),
      ],
      child: MaterialApp(
        title: '1Fi Marketplace',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainNavScreen(initialIndex: 1), // Opens on Shop Tab
      ),
    );
  }
}
