import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/emi_plan_model.dart';
import '../models/product_model.dart';
import '../models/product_variant_model.dart';

class BrandItem {
  final String name;
  final String subtitle;
  final Color logoBg;
  final String? logoText;
  final IconData? icon;

  const BrandItem({
    required this.name,
    required this.subtitle,
    required this.logoBg,
    this.logoText,
    this.icon,
  });
}

class NearbyStoreItem {
  final String name;
  final String address;
  final String distance;
  final Color logoBg;
  final String? logoText;

  const NearbyStoreItem({
    required this.name,
    required this.address,
    required this.distance,
    required this.logoBg,
    this.logoText,
  });
}

class MockProductsData {
  static const List<BrandItem> topBrands = [
    BrandItem(name: 'Air India', subtitle: 'No-cost EMIs upto 18 months', logoBg: Color(0xFFD32F2F), logoText: 'AIR INDIA'),
    BrandItem(name: 'Apple Premium Reseller', subtitle: 'No-cost EMIs upto 24 months', logoBg: Colors.black, icon: Icons.apple),
    BrandItem(name: 'CaratLane', subtitle: 'No-cost EMIs upto 6 months', logoBg: Color(0xFF6B21A8), logoText: 'CARATLANE'),
    BrandItem(name: 'Tanishq Studded', subtitle: 'No-cost EMIs upto 12 months', logoBg: Color(0xFF831843), logoText: 'TANISHQ'),
    BrandItem(name: 'Vijay Sales', subtitle: 'No-cost EMIs upto 6 months', logoBg: Color(0xFFDC2626), logoText: 'VIJAY SALES'),
    BrandItem(name: 'Wakefit', subtitle: 'No-cost EMIs upto 12 months', logoBg: Color(0xFF1E1B4B), logoText: 'WAKEFIT'),
    BrandItem(name: 'World of Titan', subtitle: 'No-cost EMIs upto 24 months', logoBg: Color(0xFF99F6E4), logoText: 'TITAN'),
    BrandItem(name: 'Yatra Hotels & Holidays', subtitle: 'No-cost EMIs upto 24 months', logoBg: Color(0xFFE11D48), logoText: 'YATRA'),
  ];

  static const List<NearbyStoreItem> nearbyStores = [
    NearbyStoreItem(name: 'Atelier Forbidden Journeys', address: 'Sector 40, Gurugram, Haryana, 122001', distance: '28 KM', logoBg: Color(0xFFFEF08A), logoText: 'ATELIER'),
    NearbyStoreItem(name: 'TripBouquet', address: '241, Tower B, Spazedge, near Dmart, Gurugram, 122018', distance: '28 KM', logoBg: Color(0xFFFFFFFF), logoText: 'TRIPBOUQUET'),
    NearbyStoreItem(name: 'Charger On Wheels', address: 'Orchid Business Park, Near Subhash Chowk, Gurugram', distance: '29 KM', logoBg: Color(0xFFF3F4F6), logoText: 'CHARGER'),
    NearbyStoreItem(name: 'Pacholi Suzuki Rajiv Chowk', address: '6/38, Rajiv Chowk, Sector 33, Gurugram, 122001', distance: '30 KM', logoBg: Color(0xFFFFFFFF), logoText: 'SUZUKI'),
    NearbyStoreItem(name: 'Pacholi Suzuki Railway Rd', address: '64/9, New Railway Rd, near DSD college, Gurugram', distance: '31 KM', logoBg: Color(0xFFFFFFFF), logoText: 'SUZUKI'),
    NearbyStoreItem(name: 'Malwa Honda Khandsa Rd', address: '60, Khandsa Rd, Pace City I, Sector 10A, Gurugram', distance: '32 KM', logoBg: Color(0xFFFFFFFF), logoText: 'HONDA'),
  ];
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'all',
      name: 'All Items',
      icon: Icons.grid_view_rounded,
      bannerSubtitle: 'Browse all products with 0% EMI',
    ),
    CategoryModel(
      id: 'phones',
      name: 'Smartphones',
      icon: Icons.phone_android_rounded,
      bannerSubtitle: 'Latest 5G Flagships from ₹2,499/mo',
    ),
    CategoryModel(
      id: 'laptops',
      name: 'Laptops',
      icon: Icons.laptop_mac_rounded,
      bannerSubtitle: 'Powerhouse Workstations & Ultrabooks',
    ),
    CategoryModel(
      id: 'audio',
      name: 'Audio & ANC',
      icon: Icons.headphones_rounded,
      bannerSubtitle: 'Immersive Audio with 0 Downpayment',
    ),
    CategoryModel(
      id: 'tablets',
      name: 'Tablets',
      icon: Icons.tablet_mac_rounded,
      bannerSubtitle: 'iPads & Flagship Android Tablets',
    ),
    CategoryModel(
      id: 'gaming',
      name: 'Gaming & Watch',
      icon: Icons.sports_esports_rounded,
      bannerSubtitle: 'Consoles & Smartwatches on flexible tenure',
    ),
  ];

  static const List<EmiPlanModel> standardEmiPlans = [
    EmiPlanModel(
      id: 'emi_3_no_cost',
      tenureMonths: 3,
      annualInterestRate: 0.0,
      isZeroCost: true,
      processingFee: 0.0,
      downPayment: 0.0,
      specialOfferTag: '0% Interest No-Cost',
    ),
    EmiPlanModel(
      id: 'emi_6_no_cost',
      tenureMonths: 6,
      annualInterestRate: 0.0,
      isZeroCost: true,
      processingFee: 0.0,
      downPayment: 0.0,
      specialOfferTag: 'Most Popular',
    ),
    EmiPlanModel(
      id: 'emi_9_std',
      tenureMonths: 9,
      annualInterestRate: 11.5,
      isZeroCost: false,
      processingFee: 199.0,
      downPayment: 0.0,
      specialOfferTag: 'Low Monthly',
    ),
    EmiPlanModel(
      id: 'emi_12_std',
      tenureMonths: 12,
      annualInterestRate: 13.5,
      isZeroCost: false,
      processingFee: 299.0,
      downPayment: 0.0,
      specialOfferTag: 'Extended Tenure',
    ),
    EmiPlanModel(
      id: 'emi_24_std',
      tenureMonths: 24,
      annualInterestRate: 15.0,
      isZeroCost: false,
      processingFee: 499.0,
      downPayment: 0.0,
      specialOfferTag: 'Lowest Monthly EMI',
    ),
  ];

  static final List<ProductModel> products = [
    // 1. iPhone 16 Pro Max
    ProductModel(
      id: 'prod_iphone_16_pro',
      name: 'Apple iPhone 16 Pro Max',
      brand: 'Apple',
      categoryId: 'phones',
      basePrice: 144900.0,
      originalPrice: 159900.0,
      thumbnail: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'iPhone 16 Pro Max. Forged in titanium and featuring the groundbreaking A18 Pro chip, customizable Action button, and Camera Control.',
      keyFeatures: [
        'A18 Pro chip with 6-core GPU',
        '6.9-inch Super Retina XDR display with ProMotion',
        '48MP Fusion Camera with 5x Telephoto zoom',
        'Grade 5 Titanium design with micro-blasted finish',
        'Up to 33 hours video playback battery life',
      ],
      specifications: {
        'Processor': 'Apple A18 Pro Bionic (3nm)',
        'Display': '6.9-inch OLED, 120Hz ProMotion',
        'Main Camera': '48MP + 48MP Ultra-wide + 12MP 5x Telephoto',
        'Front Camera': '12MP TrueDepth Camera',
        'Battery': '4,685 mAh with Fast MagSafe charging',
        'Weight': '227 grams',
        'Operating System': 'iOS 18',
      },
      rating: 4.9,
      ratingCount: 842,
      badge: 'Best Seller',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_desert', name: 'Desert Titanium', color: Color(0xFFC7B198)),
        ColorVariant(id: 'c_natural', name: 'Natural Titanium', color: Color(0xFF9E9A93)),
        ColorVariant(id: 'c_white', name: 'White Titanium', color: Color(0xFFF2F1ED)),
        ColorVariant(id: 'c_black', name: 'Black Titanium', color: Color(0xFF282829)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_256', label: '256 GB', price: 144900.0, originalPrice: 159900.0),
        StorageVariant(id: 's_512', label: '512 GB', price: 164900.0, originalPrice: 179900.0),
        StorageVariant(id: 's_1tb', label: '1 TB', price: 184900.0, originalPrice: 199900.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Apple International Warranty',
      deliveryEstimate: 'Free Express Delivery by Tomorrow',
    ),

    // 2. Samsung Galaxy S24 Ultra
    ProductModel(
      id: 'prod_samsung_s24_ultra',
      name: 'Samsung Galaxy S24 Ultra 5G',
      brand: 'Samsung',
      categoryId: 'phones',
      basePrice: 129999.0,
      originalPrice: 134999.0,
      thumbnail: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'Meet Galaxy S24 Ultra, the ultimate form of Galaxy Ultra with a new titanium exterior and a 6.8-inch flat display with Galaxy AI.',
      keyFeatures: [
        'Galaxy AI with Circle to Search & Live Translate',
        'Snapdragon 8 Gen 3 for Galaxy',
        '200MP Quad Telephoto Camera with AI Zoom',
        'Built-in S Pen stylus included',
        'Titanium frame with Gorilla Armor glass',
      ],
      specifications: {
        'Processor': 'Snapdragon 8 Gen 3 (4nm)',
        'Display': '6.8-inch Dynamic AMOLED 2X, 2600 nits',
        'Main Camera': '200MP + 50MP + 12MP + 10MP',
        'Front Camera': '12MP Dual Pixel AF',
        'Battery': '5,000 mAh with 45W Fast Charging',
        'Weight': '232 grams',
        'Operating System': 'Android 14, One UI 6.1',
      },
      rating: 4.8,
      ratingCount: 630,
      badge: 'Galaxy AI Included',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_titanium_gray', name: 'Titanium Gray', color: Color(0xFF6B6E70)),
        ColorVariant(id: 'c_titanium_black', name: 'Titanium Black', color: Color(0xFF222629)),
        ColorVariant(id: 'c_titanium_violet', name: 'Titanium Violet', color: Color(0xFF4C4177)),
        ColorVariant(id: 'c_titanium_yellow', name: 'Titanium Yellow', color: Color(0xFFE5D484)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_256', label: '12GB | 256 GB', price: 129999.0, originalPrice: 134999.0),
        StorageVariant(id: 's_512', label: '12GB | 512 GB', price: 139999.0, originalPrice: 144999.0),
        StorageVariant(id: 's_1tb', label: '12GB | 1 TB', price: 159999.0, originalPrice: 164999.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Samsung India Warranty',
      deliveryEstimate: 'Free Delivery in 2 Days',
    ),

    // 3. Apple MacBook Pro M3 Pro
    ProductModel(
      id: 'prod_macbook_pro_m3',
      name: 'Apple MacBook Pro 14" (M3 Pro)',
      brand: 'Apple',
      categoryId: 'laptops',
      basePrice: 199900.0,
      originalPrice: 209900.0,
      thumbnail: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'MacBook Pro with M3 Pro chip powers through demanding workflows with incredible power efficiency and up to 18 hours of battery life.',
      keyFeatures: [
        'Apple M3 Pro 11-core CPU, 14-core GPU',
        '14.2-inch Liquid Retina XDR display with 1000 nits sustained',
        '18GB Unified Memory with 150GB/s bandwidth',
        'Three Thunderbolt 4 ports, HDMI, SDXC, MagSafe 3',
        'Space Black finish with anodization seal',
      ],
      specifications: {
        'Processor': 'Apple M3 Pro Chip',
        'Display': '14.2-inch Mini-LED, 3024x1964, 120Hz',
        'Memory': '18GB Unified RAM',
        'Storage': '512GB / 1TB SSD',
        'Battery Life': 'Up to 18 Hours',
        'Weight': '1.61 kg',
        'Operating System': 'macOS Sequoia',
      },
      rating: 4.9,
      ratingCount: 420,
      badge: 'Zero Downpayment',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_space_black', name: 'Space Black', color: Color(0xFF2E3033)),
        ColorVariant(id: 'c_silver', name: 'Silver', color: Color(0xFFE1E2E5)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_512', label: '18GB | 512 GB SSD', price: 199900.0, originalPrice: 209900.0),
        StorageVariant(id: 's_1tb', label: '18GB | 1 TB SSD', price: 239900.0, originalPrice: 249900.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Apple Official Warranty',
      deliveryEstimate: 'Free Express Delivery in 24 Hours',
    ),

    // 4. Sony WH-1000XM5 ANC Headphones
    ProductModel(
      id: 'prod_sony_wh1000xm5',
      name: 'Sony WH-1000XM5 Wireless ANC',
      brand: 'Sony',
      categoryId: 'audio',
      basePrice: 26990.0,
      originalPrice: 34990.0,
      thumbnail: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'Industry-leading noise canceling with two processors and 8 microphones for unprecedented quiet. Crystal clear hands-free calling with Precise Voice Pickup.',
      keyFeatures: [
        'HD Noise Canceling Processor QN1 & V1 integrated processor',
        'Up to 30 hours battery life with quick charging (3 min for 3 hrs)',
        'Ultra-comfortable, lightweight design with soft fit leather',
        'Speak-to-Chat and multipoint connection for 2 devices',
        'Lossless LDAC audio codec support',
      ],
      specifications: {
        'Driver Unit': '30mm Carbon Fiber composite',
        'Frequency Response': '4 Hz - 40,000 Hz',
        'Battery Life': '30 hours (ANC On), 40 hours (ANC Off)',
        'Bluetooth': 'Version 5.2 with LDAC / AAC / SBC',
        'Weight': '250 grams',
      },
      rating: 4.7,
      ratingCount: 1450,
      badge: 'Top Rated',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_black', name: 'Black', color: Color(0xFF1E1E1E)),
        ColorVariant(id: 'c_silver', name: 'Silver / Cream', color: Color(0xFFE8E5DF)),
        ColorVariant(id: 'c_midnight_blue', name: 'Midnight Blue', color: Color(0xFF1F2A44)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_std', label: 'Standard Edition', price: 26990.0, originalPrice: 34990.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Sony Domestic Warranty',
      deliveryEstimate: 'Free Same-Day Delivery available',
    ),

    // 5. Apple iPad Air 13" (M2)
    ProductModel(
      id: 'prod_ipad_air_m2',
      name: 'Apple iPad Air 13" (M2 Chip)',
      brand: 'Apple',
      categoryId: 'tablets',
      basePrice: 79900.0,
      originalPrice: 84900.0,
      thumbnail: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'The redesigned 13-inch iPad Air is supercharged by the astonishingly fast Apple M2 chip. It features a stunning Liquid Retina display, landscape camera, and all-day battery life.',
      keyFeatures: [
        'Apple M2 chip with 8-core CPU and 10-core GPU',
        '13-inch Liquid Retina display with True Tone and P3 wide color',
        'Landscape 12MP Ultra Wide front camera with Center Stage',
        'Supports Apple Pencil Pro and Magic Keyboard',
        'Blazing-fast Wi-Fi 6E connectivity',
      ],
      specifications: {
        'Processor': 'Apple M2 8-core CPU',
        'Display': '13.0-inch Liquid Retina (2732x2048)',
        'Storage': '128GB / 256GB / 512GB',
        'Camera': '12MP Wide back camera with 4K video',
        'Battery': '36.59 watt-hour rechargeable battery',
        'Weight': '617 grams',
      },
      rating: 4.8,
      ratingCount: 512,
      badge: 'New Launch',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_space_gray', name: 'Space Gray', color: Color(0xFF535355)),
        ColorVariant(id: 'c_blue', name: 'Blue', color: Color(0xFFABC4D8)),
        ColorVariant(id: 'c_purple', name: 'Purple', color: Color(0xFFC7BED9)),
        ColorVariant(id: 'c_starlight', name: 'Starlight', color: Color(0xFFE5DDD3)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_128', label: '128 GB (Wi-Fi)', price: 79900.0, originalPrice: 84900.0),
        StorageVariant(id: 's_256', label: '256 GB (Wi-Fi)', price: 89900.0, originalPrice: 94900.0),
        StorageVariant(id: 's_512', label: '512 GB (Wi-Fi)', price: 109900.0, originalPrice: 114900.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Apple Warranty',
      deliveryEstimate: 'Free Delivery in 2 Days',
    ),

    // 6. Sony PlayStation 5 Slim
    ProductModel(
      id: 'prod_ps5_slim',
      name: 'Sony PlayStation 5 Slim (Disc Edition)',
      brand: 'Sony',
      categoryId: 'gaming',
      basePrice: 54990.0,
      originalPrice: 59990.0,
      thumbnail: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=800&auto=format&fit=crop&q=80',
      images: [
        'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=800&auto=format&fit=crop&q=80',
        'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=800&auto=format&fit=crop&q=80',
      ],
      description:
          'Experience lightning-fast loading with an ultra-high speed 1TB SSD, deeper immersion with haptic feedback, adaptive triggers, and 3D Audio.',
      keyFeatures: [
        'Slim design with 30% reduction in volume and weight',
        '1TB Custom Ultra-High Speed NVMe SSD',
        'Ray Tracing support with up to 120 fps at 4K resolution',
        'Includes DualSense Wireless Controller',
        'Ultra HD Blu-ray disc drive included',
      ],
      specifications: {
        'CPU': 'x86-64-AMD Ryzen Zen 2 (8 Cores / 16 Threads)',
        'GPU': 'AMD Radeon RDNA 2-based graphics engine (10.3 TFLOPS)',
        'Storage': '1TB NVMe SSD',
        'Video Out': 'Support of 4K 120Hz TVs, 8K TVs, VRR',
        'Audio': '"Tempest" 3D AudioTech',
      },
      rating: 4.9,
      ratingCount: 1890,
      badge: 'Gamer Choice',
      isZeroCostEmiAvailable: true,
      colorVariants: const [
        ColorVariant(id: 'c_white', name: 'Glacier White', color: Color(0xFFF0F0F0)),
        ColorVariant(id: 'c_cosmic_red', name: 'Cosmic Red', color: Color(0xFF9E1B32)),
        ColorVariant(id: 'c_midnight_black', name: 'Midnight Black', color: Color(0xFF1E1E1E)),
      ],
      storageVariants: const [
        StorageVariant(id: 's_1tb', label: '1 TB Disc Edition', price: 54990.0, originalPrice: 59990.0),
      ],
      emiPlans: standardEmiPlans,
      warrantyInfo: '1 Year Sony Official Warranty',
      deliveryEstimate: 'Free Express Delivery in 2 Days',
    ),
  ];
}
