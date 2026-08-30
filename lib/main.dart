import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Baju Bola',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String _jerseyArsenal =
      'https://images.unsplash.com/photo-1577212017184-80cc0da11082?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  // Tambah produk baru cukup tambah item di list ini,
  // layout akan otomatis menyesuaikan (wrap ke bawah)
  final List<_Product> _products = const [
    _Product(
      imagePath: _jerseyArsenal,
      isNetworkImage: true,
      name: 'Jersey Home Arsenal',
      price: 'Rp 1.200.000',
      discountLabel: 'DISKON 20%',
    ),
    _Product(
      imagePath: 'assets/images/lokal.jpg',
      isNetworkImage: false,
      name: 'Jersey Putih Polos',
      price: 'Rp 280.000',
      discountLabel: 'DISKON 10%',
    ),
    _Product(
      imagePath: _jerseyArsenal,
      isNetworkImage: true,
      name: 'Jersey Home Arsenal',
      price: 'Rp 1.200.000',
      discountLabel: 'DISKON 20%',
    ),
    _Product(
      imagePath: _jerseyArsenal,
      isNetworkImage: true,
      name: 'Jersey Home Arsenal',
      price: 'Rp 1.200.000',
      discountLabel: 'DISKON 20%',
    ),
    _Product(
      imagePath: _jerseyArsenal,
      isNetworkImage: true,
      name: 'Jersey Home Arsenal',
      price: 'Rp 1.200.000',
      discountLabel: 'DISKON 20%',
    ),
    _Product(
      imagePath: _jerseyArsenal,
      isNetworkImage: true,
      name: 'Jersey Home Arsenal',
      price: 'Rp 1.200.000',
      discountLabel: 'DISKON 20%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Toko Baju Bola'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, // lebar maksimal tiap kartu
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68, // rasio tinggi:lebar kartu
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return ProductCard(
              imagePath: product.imagePath,
              isNetworkImage: product.isNetworkImage,
              name: product.name,
              price: product.price,
              discountLabel: product.discountLabel,
            );
          },
        ),
      ),
    );
  }
}

class _Product {
  final String imagePath;
  final bool isNetworkImage;
  final String name;
  final String price;
  final String discountLabel;

  const _Product({
    required this.imagePath,
    required this.isNetworkImage,
    required this.name,
    required this.price,
    required this.discountLabel,
  });
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final bool isNetworkImage;
  final String name;
  final String price;
  final String discountLabel;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.isNetworkImage,
    required this.name,
    required this.price,
    required this.discountLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: isNetworkImage
                    ? Image.network(
                        imagePath,
                        width: double.infinity,
                        height: 130,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imagePath,
                        width: double.infinity,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discountLabel,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}