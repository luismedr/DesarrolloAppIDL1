import 'package:flutter/material.dart';

void main() {
  runApp(TiendaVirtualApp());
}

class TiendaVirtualApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: 1, name: 'Lavadora', price: 699.99, image: 'assets/lavadora.jpg'),
    Product(
        id: 2,
        name: 'Refrigerador',
        price: 6499.99,
        image: 'assets/refrigerador.jpg'),
    Product(
        id: 3,
        name: 'Horno Microondas',
        price: 349.99,
        image: 'assets/microondas.jpg'),
    Product(
        id: 4,
        name: 'Televisor',
        price: 13499.99,
        image: 'assets/Televisor.jpg'),
    Product(id: 5, name: 'Cocina', price: 800.00, image: 'assets/cocina.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda Electronica'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                products[index].image,
                width: 60,
                height: 60,
              ),
              title: Text(products[index].name),
              subtitle: Text('\S/ ${products[index].price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            product.image,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(product.name, style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          Text('\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
