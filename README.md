# 1Fi EMI Marketplace — Flutter Application

A production-grade, pixel-perfect **1Fi EMI Marketplace & Checkout Experience** built with **Flutter 3.x / Dart 3.x**, following modern Indian fintech standards (CRED, PhonePe, Google Pay).

---

## 📱 Features & Highlights

### 1. Navigation & Shop Architecture
- **5-Item Bottom Navigation Bar**: `Home`, `Shop`, `EMI Dues`, `Limit`, and `Profile` with custom vector outline icons (`24x24dp`, `2.0px` stroke weight, rounded caps/joins).
- **Active Navigation**: `Shop` tab selected with 1Fi purple top indicator bar and active outline styling.
- **Shop Top Hero Banner**: 1Fi deep purple gradient banner with custom 3D shopping illustration.
- **3-Tab Capsule Bar**:
  - `Top Brands` — Clean blank state (per assignment spec).
  - `Nearby Stores` — Clean blank state (per assignment spec).
  - `1Fi Marketplace` — Complete interactive marketplace.

### 2. 1Fi Marketplace
- **Live Instant Search**: Filter products in real-time by title, brand, or category.
- **Filter & Sort Modal**: Clean bottom sheet supporting sorting (Popular, Lowest EMI, Price Low-High, Price High-Low, Rating), Max price budget tiers, and Zero-Cost EMI toggle switch.
- **Category Chips**: Fast switching across `All`, `Smartphones`, `Laptops`, `Audio`, `Gaming`, `Wearables`.
- **Promo Banner**: Soft lavender-purple gradient card for *Zero-Cost EMI Deals*.
- **2-Column Product Grid**:
  - Balanced 0.68 aspect ratio with flushed layout (no empty gaps).
  - Product thumbnail, brand pill, ratings, discounted & original prices.
  - Distinct purple pill: `EMI from ₹X/mo` with `0% No-Cost` tags.

### 3. Product Detail ("Pay using 1Fi")
- **Variant Selector**: Interactive storage and color options with instant live price synchronization.
- **1Fi EMI Plans Calculator**:
  - Supports 3M, 6M, 9M, 12M, and 24M tenure plans.
  - Standard financial amortization formula:
    $$E = P \cdot r \cdot \frac{(1+r)^n}{(1+r)^n - 1}$$
  - Zero-Cost EMI merchant subvention/subsidy calculation.
  - Full interactive **Month-by-Month Repayment Schedule Table** (Principal, Interest, Balance).
  - Technical specifications accordion.
- **Sticky Bottom Action Bar**: Live selected EMI summary with light lavender `Proceed Plan` CTA.

### 4. Instant Checkout & Approval
- **Pre-Approved Limit Card**: Emerald green gradient status card with instant 1Fi credit approval.
- **Complete Order Summary**: Down payment (₹0), processing fee, EMI tenure, and first due date.
- **Place Order CTA**: Green `Confirm & Place Order` button with instant order processing simulation.

### 5. Order Confirmation
- **Success Screen**: Emerald green checkmark circle with order reference, loan amount disbursed, and first EMI repayment schedule.
- **Return Action**: Clean `Back to 1Fi Shop` button to seamlessly return to the marketplace.

---

## 🏛 Architecture & Folder Structure

```
lib/
├── core/
│   ├── constants/        # AppColors, AppDimens, AppTextStyles
│   └── utils/            # EmiCalculator, CurrencyFormatter
├── data/
│   ├── mock/             # Mock product catalog & EMI plan configurations
│   └── models/           # ProductModel, EmiPlanModel, OrderModel
├── presentation/
│   ├── checkout/         # EmiCheckoutScreen, OrderSuccessScreen
│   ├── common_widgets/   # CustomButton, CustomBadge, ResponsiveContainer
│   ├── emi_dues/         # EmiDuesScreen
│   ├── home/             # HomeScreen
│   ├── limit/            # LimitScreen
│   ├── marketplace/      # MarketplaceView, FilterModal, ProductCard, SearchHeader
│   ├── navigation/       # MainNavScreen, NavIcons (Custom vector painters)
│   ├── product_detail/   # ProductDetailScreen, EmiCalculatorWidget, RepaymentScheduleTable
│   ├── profile/          # ProfileScreen
│   └── shop/             # ShopContentScreen, BlankTab
└── providers/            # MarketplaceProvider, ProductDetailProvider, CheckoutProvider
```

---

## 🧪 Testing & Verification

Comprehensive unit and widget tests covering financial calculations, search algorithms, and UI components:

```bash
# Run all tests
flutter test

# Run static analysis
flutter analyze
```

- **Analysis**: `0 issues found`
- **Tests**: `12/12 passing`

---

## 🚀 How to Run

### 1. Prerequisites
- Flutter SDK (v3.19+ or higher)
- Dart SDK (v3.3+ or higher)

### 2. Setup
```bash
# Clone the repository
git clone <your-repo-url>
cd 1Fi

# Get dependencies
flutter pub get
```

### 3. Launch App
```bash
# Run on Windows Desktop
flutter run -d windows

# Run on Chrome Web
flutter run -d chrome

# Run on Android Emulator / Device
flutter run -d android
```

---

## 📦 Build Release Artifacts (Optional)

```bash
# Build Android APK
flutter build apk --release

# Build Windows Executable
flutter build windows --release

# Build Web App
flutter build web --release
```
